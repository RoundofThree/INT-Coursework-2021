(define (problem problem_1)
    (:domain sokoban)
    (:objects
        sq-a1 sq-a2 sq-a3 sq-b1 sq-b2 sq-b3 sq-c1 sq-c2 sq-c3 sq-d1 sq-d2 sq-d3 sq-e1 sq-e2 sq-e3 sq-f1 sq-f2 sq-f3 - square
    )
    (:init
        ;todo: put the initial state's facts and numeric values here
        ;6*3 grid
        (above sq-a1 sq-a2)
        (above sq-a2 sq-a3)
        (above sq-b1 sq-b2)
        (above sq-b2 sq-b3)
        (above sq-c1 sq-c2)
        (above sq-c2 sq-c3)
        (above sq-d1 sq-d2)
        (above sq-d2 sq-d3)
        (above sq-e1 sq-e2)
        (above sq-e2 sq-e3)
        (above sq-f1 sq-f2)
        (above sq-f2 sq-f3)

        (below sq-a2 sq-a1)
        (below sq-a3 sq-a2)
        (below sq-b2 sq-b1)
        (below sq-b3 sq-b2)
        (below sq-c2 sq-c1)
        (below sq-c3 sq-c2)
        (below sq-d2 sq-d1)
        (below sq-d3 sq-d2)
        (below sq-e2 sq-e1)
        (below sq-e3 sq-e2)
        (below sq-f2 sq-f1)
        (below sq-f3 sq-f2)

        (left-to sq-a1 sq-b1)
        (left-to sq-a2 sq-b2)
        (left-to sq-a3 sq-b3)
        (left-to sq-b1 sq-c1)
        (left-to sq-b2 sq-c2)
        (left-to sq-b3 sq-c3)
        (left-to sq-c1 sq-d1)
        (left-to sq-c2 sq-d2)
        (left-to sq-c3 sq-d3)
        (left-to sq-d1 sq-e1)
        (left-to sq-d2 sq-e2)
        (left-to sq-d3 sq-e3)
        (left-to sq-e1 sq-f1)
        (left-to sq-e2 sq-f2)
        (left-to sq-e3 sq-f3)

        (right-to sq-b1 sq-a1)
        (right-to sq-b2 sq-a2)
        (right-to sq-b3 sq-a3)
        (right-to sq-c1 sq-b1)
        (right-to sq-c2 sq-b2)
        (right-to sq-c3 sq-b3)
        (right-to sq-d1 sq-c1)
        (right-to sq-d2 sq-c2)
        (right-to sq-d3 sq-c3)
        (right-to sq-e1 sq-d1)
        (right-to sq-e2 sq-d2)
        (right-to sq-e3 sq-d3)
        (right-to sq-f1 sq-e1)
        (right-to sq-f2 sq-e2)
        (right-to sq-f3 sq-e3)

        (is-empty sq-b2)
        (is-empty sq-e2)
        (is-empty sq-d2)
        
        (box-at sq-c2)

        (player-at sq-d2)
    )

    (:goal
        (and
            ;todo: put the goal condition here
            (box-at sq-b2)
        )
    )

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)