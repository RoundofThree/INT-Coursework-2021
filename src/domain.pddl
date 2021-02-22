(define
    (domain example)
    (:requirements :strips)

    ;(:domain-variables ) ;deprecated

    (:predicates
        (some-fact ?a)
        (some-goal ?a)
    )

    (:action DO-STUFF
        :parameters (?a)
        :precondition (and
            (some-fact ?a)
        )
        :effect (and
            (some-goal ?a)
        )
        ; :expansion ;deprecated
    )
)