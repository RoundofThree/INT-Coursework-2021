(define
    (problem a_problem)
    (:domain example)
    ;(:situation <situation_name>) ;deprecated
    (:objects some-object)
    (:init
        (some-fact some-object)
    )
    (:goal (and
            (some-goal some-object)
        )
    )
)