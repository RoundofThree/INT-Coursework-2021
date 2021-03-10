; OPTIC planner is good at scheduling the delivery of perishable goods, expressed in preferences (soft goals)
(define 
    (domain farm-supply-chain)
    (:requirements :strips :typing :equality :numeric-fluents :durative-actions :continuous-effects :action-costs :time :conditional-effects :constraints) 

    (:types
        ; blueberry blackberry raspberry - fruit ; types of fruit 
        intersection  ; this is a semaphore 
        road 
        truck 
        client 
        farm 
        fruit
    )

    ; boolean facts
    (:predicates 
        (truck-at ?t - truck ?i - intersection)   ; truck attributes 
        (truck-holds ?f - fruit)                  ; could NOT be multiple

        (farm-at ?f - farm ?i - intersection)     ; farm attributes
        ; (farm-available ?f - farm)                ; no other truck is loading 
        (production-type ?f - farm ?fr - fruit)   ; UNIQUE production type, ensure this restriction in problem file 

        (client-at ?c - client ?i - intersection) ; client attributes 
        (demand-type ?c - client ?fr - fruit)     ; demand type, could NOT be multiple
        (client-satisfied ?c - client)            ; element of goal state 

        (road-begin ?r - road ?i - intersection)  ; road beginning intersection 
        (road-end ?r - road ?i - intersection)    ; road ending intersection 
        (occupied ?i - intersection)                 ; occupied by truck   

        (green-light ?r - road) ; traffic, will change and stay for a scheduled time 
                                                  ; semaphore is green for trucks at road r
        (can-start-time)
    )

    ; numeric facts 
    (:functions 
        (truck-max-weight ?t - truck)             ; truck attributes 
        ; (truck-holds-quantity ?t - truck ?f - fruit)         
        (truck-weight ?t - truck)                 ; current weight can be computed as x*a1+y*a2+z*a3+... but better stated here

        (production-rate ?f - farm)               ; farm attributes 
        (farm-capacity ?f - farm)                 ; capacity can't be implemented if actions are synchronized and concurrent, when the planner doesn't support conditional-effects 
        (farm-quantity ?f - farm)          ; in weight 

        (demand-quantity ?c - client ?fr - fruit) ; in weight ; client attributes 
        (reward-slope ?c - client) ; slope of decrease
        (initial-reward ?c - client)

        ; (weight ?f - fruit)                       ; fruit attributes  

        (cross-time ?r - road)                    ; time needed to cross road because of its length 

        (time-left ?r - road)   ; time needed to change red to green or green to red 
        (green-time ?r - road)  ; length of green interval, should be constant over the plan execution 
        (red-time ?r - road)    ; length of red interval 

        (current-time)                            
        (total-reward)                            
    )

    ; timer 
    (:process time-ticker
        :parameters ()
        :precondition (can-start-time)
        :effect (and 
            (increase (current-time) (* #t 1.0))
        )
    )

    ; farm production process 
    (:process produce 
        :parameters (?f - farm) 
        :precondition (and 
            (<= (farm-capacity ?f) (+ (farm-quantity ?f) (production-rate ?f)))
        )
        :effect (and 
            (increase (farm-quantity ?f) (* #t (production-rate ?f)))
        )
    )

    ; ACTIONS: load fruit, unload fruit
    ; move from intersection to intersection (given semaphore and emptiness of that intersection)

    ; load all fruit available at farm from start 
    (:durative-action load-fruit    
        :parameters (?t - truck ?i - intersection ?f - farm ?fr - fruit) 
        :duration (= ?duration (farm-quantity ?f))
        :condition (and 
            ; truck does not hold any other fruit at start 
            (at start (forall (?fri - fruit) (not (truck-holds ?t ?fri))))
            (at start (farm-at ?f ?i))
            (at start (truck-at ?t ?i))
            (at start (production-type ?f ?fr))
            (at start (<= (farm-quantity ?f) (- (truck-max-weight ?t) (truck-weight ?t))))  ; truck has capacity 
        )
        :effect (and 
            (at start (not (farm-at ?f ?i))) ; farm not available
            (at start (not (truck-at ?t ?i))) ; truck not available 
            (at start (truck-holds ?fr))
            (increase (truck-weight ?t) (* #t 1.0))
            (decrease (farm-quantity ?f) (* #t 1.0))
            (at end (farm-at ?f ?i)) ; farm available again
            (at end (truck-at ?t ?i)) ; truck available again 
        )
    )

    (:durative-action partial-load-fruit
        :parameters (?t - truck ?i - intersection ?f - farm ?fr - fruit)
        :duration (= ?duration (- (truck-max-weight ?t) (truck-weight ?t)))
        :condition (and 
            ; truck does not hold any other fruit at start 
            (at start (forall (?fri - fruit) (not (truck-holds ?t ?fri))))
            (at start (farm-at ?f ?i))
            (at start (truck-at ?t ?i))
            (at start (production-type ?f ?fr))
            (at start (> (farm-quantity ?f) (- (truck-max-weight ?t) (truck-weight ?t))))
        )
        :effect (and 
            (at start (not (farm-at ?f ?i))) ; farm not available
            (at start (not (truck-at ?t ?i))) ; truck not available 
            (at start (truck-holds ?fr))
            (increase (truck-weight ?t) (* #t 1.0))
            (decrease (farm-quantity ?f) (* #t 1.0))
            (at end (farm-at ?f ?i)) ; farm available again
            (at end (truck-at ?t ?i)) ; truck available again 
        )
    )

    ; unload all the available at truck
    (:durative-action unload-fruit
        :parameters (?t - truck ?i - intersection ?c - client ?fr - fruit)
        :duration (= ?duration (truck-weight ?t))
        :condition (and 
            (at start (not (client-satisfied ?c)))  ; negative precondition not satisfied 
            (at start (client-at ?c ?i))
            (at start (truck-at ?t ?i))
            (at start (truck-holds ?fr))
            (at start (demand-type ?c ?fr))
            (at start (< (truck-weight ?t) (demand-quantity ?c ?fr)))
        )
        :effect (and 
            (at start (not (client-at ?c ?i)))
            (at start (not (truck-at ?t ?i)))
            (decrease (demand-quantity ?c ?fr) (* #t 1.0))
            (decrease (truck-weight ?t) (* #t 1.0))
            (at end (not (truck-holds ?fr)))
            (at end (client-at ?c ?i))
            (at end (truck-at ?t ?i))
        )
    )

    ; unload limited to client need 
    (:durative-action partial-unload-fruit
        :parameters (?t - truck ?i - intersection ?c - client ?fr - fruit)
        :duration (= ?duration (demand-quantity ?c ?fr))
        :condition (and
            (at start (> (demand-quantity ?c ?fr) 0.0))
            (at start (client-at ?c ?i))
            (at start (truck-at ?t ?i))
            (at start (truck-holds ?fr))
            (at start (demand-type ?c ?fr))
            (at start (> (truck-weight ?t) (demand-quantity ?c ?fr)))
        )
        :effect (and 
            (at start (not (client-at ?c ?i)))
            (at start (not (truck-at ?t ?i)))
            (decrease (demand-quantity ?c ?fr) (* #t 1.0))
            (decrease (truck-weight ?t) (* #t 1.0))
            (at end (client-at ?c ?i))
            (at end (truck-at ?t ?i))
            (at end (client-satisfied ?c))
            (at end (increase (total-reward) (- (initial-reward ?c) (* (current-time) (reward-slope ?c)))))
        )
    )

    (:durative-action exact-unload-fruit
        :parameters (?t - truck ?i - intersection ?c - client ?fr - fruit)
        :duration (= ?duration (demand-quantity ?c ?fr))
        :condition (and 
            (at start (> (demand-quantity ?c ?fr) 0.0))
            (at start (client-at ?c ?i))
            (at start (truck-at ?t ?i))
            (at start (truck-holds ?fr))
            (at start (demand-type ?c ?fr))
            (at start (= (truck-weight ?t) (demand-quantity ?c ?fr)))
        )
        :effect (and 
            (at start (not (client-at ?c ?i)))
            (at start (not (truck-at ?t ?i)))
            (decrease (demand-quantity ?c ?fr) (* #t 1.0))
            (decrease (truck-weight ?t) (* #t 1.0))
            (at end (client-at ?c ?i))
            (at end (truck-at ?t ?i))
            (at end (not (truck-holds ?fr)))
            (at end (client-satisfied ?c))
            (at end (increase (total-reward) (- (initial-reward ?c) (* (current-time) (reward-slope ?c)))))
        )
    )
    
    ; move from one intersection to another 
    (:durative-action move 
        :parameters (?t - truck ?r - road ?src - intersection ?dst - intersection)
        :duration (= ?duration (cross-time ?r)) 
        :condition (and 
            (at start (green-light ?r))
            (at start (truck-at ?t ?src))
            (at start (road-begin ?r ?src))
            (at start (road-end ?r ?dst))
        )
        :effect (and
            (at start (not (occupied ?src)))
            (at start (not (truck-at ?t ?src)))
            (at end (occupied ?dst))
            (at end (truck-at ?t ?dst))
        )
    )

    ; semaphore logic 
    (:process semaphore-ticker
        :parameters (?r - road)
        :precondition (and 
            (not (= (time-left ?r) 0))
        )
        :effect (and 
            (decrease (time-left ?r) (* #t 1.0))
        )
    )
)