(define
    (domain firefighter-planning)
    (:requirements :strips :typing :fluents)


    ;(:domain-variables ) ;deprecated
    (:types 
        fireStation house - location
        firefighter victim - person
        location
        person
    )
    (:predicates
        (at ?p - person ?l - location)
        (accessible ?l1 ?l2 - location)

    )
    (:functions
        (total-time-taken ?f - firefighter)
        (number-of-saved-people)
        (number-of-dead-people)
        (max-waiting-time ?v - victim)
        (time-from-to ?l1 - location ?l2 - location)
        (time-to-break-in ?h - house)


    )

    (:action move
        :parameters (?f - firefighter ?from ?to - location)
        :precondition (and
            (at ?f ?from)
            (accessible ?from ?to)
        )
        :effect (and
            (not (at ?f ?from))
            (at ?f ?to)
            (increase (total-time-taken ?f) (time-from-to ?from ?to))
        )
    )

    (:action save-people
        :parameters (?f - firefighter ?h - house ?v - victim)
        :precondition (and 
            (at ?f ?h)
            (at ?v ?h)
            (>= (max-waiting-time ?v) (+ (total-time-taken ?f) (time-to-break-in ?h)))

        )
        :effect (and
            (not (at ?v ?h))
            (increase (total-time-taken ?f) (time-to-break-in ?h))
            (increase (number-of-saved-people) 1)
        )
    )

    (:action die
        :parameters (?v - victim ?h - house ?f - firefighter)
        :precondition (and 
            (at ?v ?h)
            (> (total-time-taken ?f) (max-waiting-time ?v))
        )
        :effect (and 
            (not (at ?v ?h))
            (increase (number-of-dead-people) 1)
        )
        ; :expansion ;deprecated
    )
    
    
)