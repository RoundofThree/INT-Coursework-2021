(define
    (problem easy-firefighting-strategy)
    (:domain firefighter-planning)
    ;(:situation <situation_name>) ;deprecated
    (:objects 
        fs1 - fireStation
        f1 - firefighter
        h1 h2 - house
        v1 v2 v3 v4 v5 - victim
    )
    (:init
        (at f1 fs1)
        (at v1 h1)
        (at v2 h1)
        (at v3 h2)
        (at v4 h2)
        (at v5 h2)

        (accessible fs1 h1)
        (accessible h1 fs1)
        (accessible fs1 h2)
        (accessible h2 fs1)
        (accessible h1 h2)
        (accessible h2 h1)

        (= (total-time-taken f1) 0)
        (= (number-of-saved-people) 0)
        (= (number-of-dead-people) 0)

        (= (max-waiting-time v1) 10)
        (= (max-waiting-time v2) 10)
        (= (max-waiting-time v3) 20)
        (= (max-waiting-time v4) 20)
        (= (max-waiting-time v5) 30)

        (= (time-from-to fs1 h1) 8)
        (= (time-from-to h1 fs1) 1)

        (= (time-from-to fs1 h2) 1)
        (= (time-from-to h2 fs1) 5)

        (= (time-from-to h1 h2) 20)
        (= (time-from-to h2 h1) 20)

        (= (time-to-break-in h1) 1)
        (= (time-to-break-in h2) 2)

    )
    (:goal (and (at f1 fs1) (= (+ (number-of-saved-people) (number-of-dead-people)) 5))
    )
    (:metric maximize (number-of-saved-people))
)