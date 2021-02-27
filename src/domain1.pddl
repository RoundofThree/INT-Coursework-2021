; OPTIC planner is good at scheduling the delivery of perishable goods, expressed in preferences (soft goals)
(define 
    (domain farm-supply-chain)
    (:requirements :strips :typing :equality :numeric-fluents :durative-actions :continuous-effects :timed-initial-literals :constraints :preferences) 

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
        (production-type ?f - farm ?fr - fruit)   ; UNIQUE production type, ensure this restriction in problem file 

        (client-at ?c - client ?i - intersection) ; client attributes 
        (demand-type ?c - client ?fr - fruit)     ; demand type, could be multiple (eg. I want two blueberries and one blackberry)

        (road-begin ?r - road ?i - intersection)  ; road beginning intersection 
        (road-end ?r - road ?i - intersection)    ; road ending intersection 

        (green-light ?r - road ?i - intersection) ; traffic, will change and stay for a scheduled time 

        (executed ?t - truck)                     ; used as a barrier to implement time notion in concurrent multiagent environment 
    )

    ; numeric facts 
    (:functions 
        (truck-max-weight ?t - truck)             ; truck attributes 
        (truck-holds-quantity ?f - fruit)         ; current weight can be computed as x*a1+y*a2+z*a3+... but better stated here
        (truck-weight ?t - truck) 

        (production-rate ?f - farm)               ; farm attributes 
        (farm-capacity ?f - farm)                 ; capacity can't be implemented if actions are synchronized and concurrent, when the planner doesn't support conditional-effects 
        (farm-quantity ?f - farm)  

        (demand-quantity ?c - client ?fr - fruit) ; client attributes 

        (weight ?f - fruit)                       ; fruit attributes  

        (cross-time ?r - road)                    ; time needed to cross road because of its length 

        (time-left ?i - intersection ?r - road)   ; time needed to change red to green or green to red 
        (green-time ?i - intersection ?r - road)  ; length of green interval 
        (red-time ?i - intersection ?r - road)    ; length of red interval 
    )

    ; should I express production of fruit as durative action that lasts forever? No. My design is: If time barrier is met, produce (or not) depending on plan.
    ; thus, this is all actions that should happen in a time quantum 
    (:action TIME_STEP
        :parameters ()  ; all farms 
        :precondition (and 
            (forall (?t - truck) (executed ?t))  ; barrier is met (all trucks have executed something)
        )
        :effect (and
            (forall (?t - truck) (not (executed ?t)))  ; reset the barrier
            (forall (?i - intersection ?r - road) (decrease (time-left ?i ?r) 1)) ; decrease time left to change traffic light 
            (forall (?fa - farm) (increase (farm-quantity ?fa) 1)) ; production in progress 
        )
    )
    ; other actions... incomplete 
)