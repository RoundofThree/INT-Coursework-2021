(define (problem p41steps)
    (:domain sokoban)
    (:objects
        sq-a1 sq-a2 sq-a3 sq-a4 - square
        sq-b1 sq-b2 sq-b3 sq-b4 - square
        sq-c1 sq-c2 sq-c3 sq-c4 - square
        sq-d1 sq-d2 sq-d3 sq-d4 - square
        sq-e1 sq-e2 sq-e3 sq-e4 - square
        sq-f1 sq-f2 sq-f3 sq-f4 - square
        sq-g1 sq-g2 sq-g3 sq-g4 - square
    )

    (:init

        (above sq-a1 sq-a2)
        (above sq-a2 sq-a3)
        (above sq-a3 sq-a4)
        (above sq-b1 sq-b2)
        (above sq-b2 sq-b3)
        (above sq-b3 sq-b4)
        (above sq-c1 sq-c2)
        (above sq-c2 sq-c3)
        (above sq-c3 sq-c4)
        (above sq-d1 sq-d2)
        (above sq-d2 sq-d3)
        (above sq-d3 sq-d4)
        (above sq-e1 sq-e2)
        (above sq-e2 sq-e3)
        (above sq-e3 sq-e4)
        (above sq-f1 sq-f2)
        (above sq-f2 sq-f3)
        (above sq-f3 sq-f4)
        (above sq-g1 sq-g2)
        (above sq-g2 sq-g3)
        (above sq-g3 sq-g4)

        (left-to sq-a1 sq-b1)
        (left-to sq-a2 sq-b2)
        (left-to sq-a3 sq-b3)
        (left-to sq-a4 sq-b4)
        (left-to sq-b1 sq-c1)
        (left-to sq-b2 sq-c2)
        (left-to sq-b3 sq-c3)
        (left-to sq-b4 sq-c4)
        (left-to sq-c1 sq-d1)
        (left-to sq-c2 sq-d2)
        (left-to sq-c3 sq-d3)
        (left-to sq-c4 sq-d4)
        (left-to sq-d1 sq-e1)
        (left-to sq-d2 sq-e2)
        (left-to sq-d3 sq-e3)
        (left-to sq-d4 sq-e4)
        (left-to sq-e1 sq-f1)
        (left-to sq-e2 sq-f2)
        (left-to sq-e3 sq-f3)
        (left-to sq-e4 sq-f4)
        (left-to sq-f1 sq-g1)
        (left-to sq-f2 sq-g2)
        (left-to sq-f3 sq-g3)
        (left-to sq-f4 sq-g4)

        (box-at sq-f2)
        (box-at sq-f3)

        (is-free sq-a2)
        (is-free sq-a3)
        (is-free sq-a4)
        (is-free sq-b2)
        (is-free sq-b4)
        (is-free sq-c1)
        (is-free sq-c2)
        (is-free sq-c3)
        (is-free sq-c4)
        (is-free sq-d1)
        (is-free sq-d2)
        (is-free sq-d3)
        (is-free sq-d4)
        (is-free sq-e2)
        (is-free sq-g2)
        (is-free sq-g3)
        (is-free sq-g4)

        (is-wall sq-a1)
        (is-wall sq-b1)
        (is-wall sq-b3)
        (is-wall sq-e1)
        (is-wall sq-e3)
        (is-wall sq-e4)
        (is-wall sq-f1)
        (is-wall sq-g1)



        (player-at sq-f4)


        (has-no-trampoline)
        (= (time) 0)
        (= (collected-coins) 0)
        (= (bombs-available) 0)
        (= (pliers-available) 0)
    )
    (:goal
        (and
            (box-at sq-b4)
            (box-at sq-d4)
        )
    )
)