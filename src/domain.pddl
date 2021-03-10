; OPTIC planner is good at scheduling the delivery of perishable goods, expressed in preferences (soft goals)
(define 
    (domain farm-supply-chain)
    (:requirements :strips :typing :equality :numeric-fluents :durative-actions :continuous-effects :action-costs :time) 

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
        (truck-holds ?t - truck ?f - fruit)                  ; could NOT be multiple
        (truck-not-holds ?t - truck ?f - fruit)

        (farm-at ?f - farm ?i - intersection)     ; farm attributes
        ; (farm-available ?f - farm)                ; no other truck is loading 
        (production-type ?f - farm ?fr - fruit)   ; UNIQUE production type, ensure this restriction in problem file 

        (client-at ?c - client ?i - intersection) ; client attributes 
        (demand-type ?c - client ?fr - fruit)     ; demand type, could NOT be multiple
        (client-satisfied ?c - client)            ; element of goal state 

        (road-begin ?r - road ?i - intersection)  ; road beginning intersection 
        (road-end ?r - road ?i - intersection)    ; road ending intersection 
        ; (occupied ?i - intersection)                 ; occupied by truck   

        (red-light ?r - road)
        (green-light ?r - road) ; traffic, will change and stay for a scheduled time 
                                                  ; semaphore is green for trucks at road r
        (can-start-time)
    )

    ; numeric facts 
    (:functions 
        ; (truck-max-weight ?t - truck)             ; truck attributes 
        ; (truck-holds-quantity ?t - truck ?f - fruit)         
        (truck-weight ?t - truck)                 ; current weight can be computed as x*a1+y*a2+z*a3+... but better stated here

        (production-rate ?f - farm)               ; farm attributes 
        ; (farm-capacity ?f - farm)                 ; capacity can't be implemented if actions are synchronized and concurrent, when the planner doesn't support conditional-effects 
        (farm-quantity ?f - farm)          ; in weight 
        ; (unload-duration ?f - farm)
        ; (load-duration ?c - client)

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
        :precondition (can-start-time)
        :effect (and 
            (increase (farm-quantity ?f) (* #t (production-rate ?f)))
        )
    )

    ; ACTIONS: load fruit, unload fruit
    ; move from intersection to intersection (given semaphore and emptiness of that intersection)

    ; load all fruit available at farm from start 
    (:action load-fruit
        :parameters (?t - truck ?i - intersection ?f - farm ?fr - fruit) 
        :precondition (and 
            (farm-at ?f ?i)
            (truck-at ?t ?i)
            (forall (?fri - fruit) (truck-not-holds ?t ?fri))
            (production-type ?f ?fr)
            (> (farm-quantity ?f) 0)
        )
        :effect (and 
            (truck-holds ?t ?fr)
            (not (truck-not-holds ?t ?fr))
            (increase (truck-weight ?t) (farm-quantity ?f))
            (assign (farm-quantity ?f) 0)
        )
    )

    (:action unload-fruit
        :parameters (?t - truck ?i - intersection ?c - client ?fr - fruit)
        :precondition (and 
            (client-at ?c ?i)
            (truck-at ?t ?i)
            (truck-holds ?t ?fr)
            (demand-type ?c ?fr)
            (>= (truck-weight ?t) (demand-quantity ?c ?fr))
        )
        :effect (and ; should be executed in order !!!!
            ; (when (= (truck-weight ?t) (demand-quantity ?c ?fr)) (and (not (truck-holds ?t ?fr)) (truck-not-holds ?t ?fr)))
            (not (truck-holds ?t ?fr))
            (not (truck-holds ?t ?fr))
            (assign (truck-weight ?t) 0)
            (assign (demand-quantity ?c ?fr) 0)
            (client-satisfied ?c)
            (not (client-at ?c ?i))
            (increase (total-reward) (+ (initial-reward ?c) (* (current-time) (reward-slope ?c))))
        )
    )
    
    ; move from one intersection to another 
    (:durative-action move 
        :parameters (?t - truck ?r - road ?src - intersection ?dst - intersection)
        :duration (= ?duration (cross-time ?r)) 
        :condition (and 
            (at start (green-light ?r))
            (at start (truck-at ?t ?src))
            (at start (> (time-left ?r) 0.0))
            (at start (road-begin ?r ?src))
            (at start (road-end ?r ?dst))
        )
        :effect (and
            (at start (not (truck-at ?t ?src)))
            (at end (truck-at ?t ?dst))
        )
    )

    ; semaphore logic 
    (:process semaphore-ticker
        :parameters (?r - road)
        :precondition (and 
            (> (time-left ?r) 0)
        )
        :effect (and 
            (decrease (time-left ?r) (* #t 1.0))
        )
    )

    ; should be an axiom not an action 
    (:action turn-green
        :parameters (?r - road)
        :precondition (and 
            (= (time-left ?r) 0.0)
            (red-light ?r)
        )
        :effect (and 
            (green-light ?r)
            (not (red-light ?r))
            (assign (time-left ?r) (green-time ?r))
        )
    )

    (:action turn-red
        :parameters (?r - road)
        :precondition (and
            (= (time-left ?r) 0.0)
            (green-light ?r)
        )
        :effect (and 
            (red-light ?r)
            (not (green-light ?r))
            (assign (time-left ?r) (red-time ?r))
        )
    )

)