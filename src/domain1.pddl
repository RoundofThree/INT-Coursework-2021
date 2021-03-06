; OPTIC planner is good at scheduling the delivery of perishable goods, expressed in preferences (soft goals)
(define 
    (domain farm-supply-chain)
    (:requirements :strips :typing :equality :numeric-fluents :durative-actions :continuous-effects :timed-initial-literals :constraints :preferences :time :conditional-effects :constraints) 

    (:types
        blueberry blackberry raspberry - fruit ; types of fruit 
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
        (truck-holds ?f - fruit)                  ; could be multiple 

        (farm-at ?f - farm ?i - intersection)     ; farm attributes 
        (farm-available ?f - farm)                ; no other truck is loading 
        (production-type ?f - farm ?fr - fruit)   ; UNIQUE production type, ensure this restriction in problem file 

        (client-at ?c - client ?i - intersection) ; client attributes 
        (demand-type ?c - client ?fr - fruit)     ; demand type, could be multiple (eg. I want two blueberries and one blackberry)

        (road-begin ?r - road ?i - intersection)  ; road beginning intersection 
        (road-end ?r - road ?i - intersection)    ; road ending intersection 

        (green-light ?r - road ?i - intersection) ; traffic, will change and stay for a scheduled time 

        ; (executed ?t - truck)                     ; NOT USED IF TIME: used as a barrier to implement time notion in concurrent multiagent environment 
    )

    ; numeric facts 
    (:functions 
        (truck-max-weight ?t - truck)             ; truck attributes 
        (truck-holds-quantity ?t - truck ?f - fruit)         
        (truck-weight ?t - truck)                 ; current weight can be computed as x*a1+y*a2+z*a3+... but better stated here

        (production-rate ?f - farm)               ; farm attributes 
        (farm-capacity ?f - farm)                 ; capacity can't be implemented if actions are synchronized and concurrent, when the planner doesn't support conditional-effects 
        (farm-quantity ?f - farm)  

        (demand-quantity ?c - client ?fr - fruit) ; client attributes 

        (weight ?f - fruit)                       ; fruit attributes  

        (cross-time ?r - road)                    ; time needed to cross road because of its length 

        (time-left ?i - intersection ?r - road)   ; time needed to change red to green or green to red 
        (green-time ?i - intersection ?r - road)  ; length of green interval, should be constant over the plan execution 
        (red-time ?i - intersection ?r - road)    ; length of red interval 

        (total-time)                              ; total time to be optimised 
    )

    ; processes 
    (:process semaphore-ticker
        :parameters (?i - intersection ?r - road)
        :precondition (and 
            (not (= (time-left ?i ?r) 0))
        )
        :effect (and 
            (decrease (time-left ?i ?r) 1)
        )
    )

    (:process turn-green 
        :parameters (?i - intersection ?r - road)  
        :precondition (and
            (not (green-light ?r ?i))
            (= (time-left ?i ?r) 0)
        )
        :effect (and 
            (green-light ?r ?i)
            (assign (time-left ?i ?r) (green-time ?i ?r))
        )
    )

    (:process turn-red 
        :parameters (?i - intersection ?r - road) 
        :precondition (and 
            (green-light ?r ?i)
            (= (time-left ?i ?r) 0)
        )
        :effect (and 
            (not (green-light ?r ?i)) 
            (assign (time-left ?i ?r) (red-time ?i ?r))
        )
    )

    (:process produce 
        :parameters (?f - farm) 
        :precondition (and 
            (< (farm-capacity ?f) (+ (farm-quantity ?f) (production-rate ?f)))
        )
        :effect (and 
            (increase (farm-quantity ?f) (production-rate ?f))
        )
    )

    (:process penalty-ticker
        :parameters ()
        :precondition ()
        :effect (and 
            (increase (total-time) 1)
        )
    )

    ; use with metric minimize total-time 

    ; TODO: safety constraint: only one turns green at any one time 
    
    
    ; other actions... incomplete 
    (:durative-action load-fruit   ; one at a time 
        :parameters (?t - truck ?i - intersection ?f - farm ?fr - fruit) 
        :duration (= ?duration 1)  ; ???? can the planner decide how much to collect, not hardcoded? 
        :condition (and 
            (at start (farm-at ?f ?i)) 
            (at start (truck-at ?t ?i))
            (at start (production-type ?f ?fr))
            (at start (farm-available ?f))
            (over all (>= (truck-max-weight ?t) (truck-weight ?t))) ; within capacity 
            (at start (> (farm-quantity ?f) 0)) ; picking up is a continuous effect, taking 1 at time, while farm has available 
        )
        :effect (and 
            (at start (not (farm-available ?f)))
            (at end (increase (truck-holds-quantity ?t ?fr) 1))
            (at end (truck-holds ?fr))
            (at end (increase (truck-weight ?t) (weight ?fr)))
            (at end (farm-available ?f))
            (at end (decrease (farm-quantity ?f) 1))
        )
    )

    (:durative-action unload-fruit)  ; give it to client, not all the fruit, but the demanded ones 

    (:durative-action move 
        :parameters (?t - truck ?r - road ?i - intersection ?dst - intersection)
        :duration (= ?duration (cross-time ?r)) 
        :condition (and 
            (at start (green-light ?r ?i))
            (at start (truck-at ?t ?i))
            (at start (road-begin ?r ?i))
            (at start (road-end ?r ?dst))
        )
        :effect (and 
            (at end (truck-at ?t ?dst))
        )
    )

)