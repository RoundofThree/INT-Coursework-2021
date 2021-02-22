(define
    (problem another_problem)
    (:domain example)
    ;(:situation <situation_name>) ;deprecated
    (:objects some-object some-other-object)
    (:init
        (some-fact some-object)
        (some-fact some-other-object)
    )
    (:goal (and
            (some-goal some-object)
            (some-goal some-other-object)
        )
    )
)