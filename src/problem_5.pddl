(define (problem p33steps)
    (:domain sokoban)
    (:objects
        sq-a1 sq-a2 sq-a3 sq-a4 sq-a5 - square
        sq-b1 sq-b2 sq-b3 sq-b4 sq-b5 - square
        sq-c1 sq-c2 sq-c3 sq-c4 sq-c5 - square
        sq-d1 sq-d2 sq-d3 sq-d4 sq-d5 - square
        sq-e1 sq-e2 sq-e3 sq-e4 sq-e5 - square
    )

    (:init

        (above sq-a1 sq-a2)
        (above sq-a2 sq-a3)
        (above sq-a3 sq-a4)
        (above sq-a4 sq-a5)
        (above sq-b1 sq-b2)
        (above sq-b2 sq-b3)
        (above sq-b3 sq-b4)
        (above sq-b4 sq-b5)
        (above sq-c1 sq-c2)
        (above sq-c2 sq-c3)
        (above sq-c3 sq-c4)
        (above sq-c4 sq-c5)
        (above sq-d1 sq-d2)
        (above sq-d2 sq-d3)
        (above sq-d3 sq-d4)
        (above sq-d4 sq-d5)
        (above sq-e1 sq-e2)
        (above sq-e2 sq-e3)
        (above sq-e3 sq-e4)
        (above sq-e4 sq-e5)

        (left-to sq-a1 sq-b1)
        (left-to sq-a2 sq-b2)
        (left-to sq-a3 sq-b3)
        (left-to sq-a4 sq-b4)
        (left-to sq-a5 sq-b5)
        (left-to sq-b1 sq-c1)
        (left-to sq-b2 sq-c2)
        (left-to sq-b3 sq-c3)
        (left-to sq-b4 sq-c4)
        (left-to sq-b5 sq-c5)
        (left-to sq-c1 sq-d1)
        (left-to sq-c2 sq-d2)
        (left-to sq-c3 sq-d3)
        (left-to sq-c4 sq-d4)
        (left-to sq-c5 sq-d5)
        (left-to sq-d1 sq-e1)
        (left-to sq-d2 sq-e2)
        (left-to sq-d3 sq-e3)
        (left-to sq-d4 sq-e4)
        (left-to sq-d5 sq-e5)

        (box-at sq-a3)
        (box-at sq-c4)

        (is-free sq-a1)
        (is-free sq-a2)
        (is-free sq-a4)
        (is-free sq-a5)
        (is-free sq-b1)
        (is-free sq-b2)
        (is-free sq-b4)
        (is-free sq-b5)
        (is-free sq-c3)
        (is-free sq-d1)
        (is-free sq-d3)
        (is-free sq-d4)
        (is-free sq-e1)

        (is-wall sq-c1)
        (is-wall sq-c2)
        (is-wall sq-c5)
        (is-wall sq-d2)
        (is-wall sq-d5)
        (is-wall sq-e2)
        (is-wall sq-e3)
        (is-wall sq-e4)
        (is-wall sq-e5)



        (player-at sq-b3)


        (has-no-trampoline)
        (= (time) 0)
        (= (collected-coins) 0)
        (= (bombs-available) 0)
        (= (pliers-available) 0)
    )
    (:goal
        (and
            (box-at sq-a3)
            (box-at sq-b1)
        )
    )
)