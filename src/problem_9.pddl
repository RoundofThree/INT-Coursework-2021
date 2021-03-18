; testing re-allocation of boxes
(define (problem test_allocation)
    (:domain sokoban)
    (:objects
        sq-a1 sq-a2 sq-a3 sq-a4 sq-a5 sq-a6 - square
        sq-b1 sq-b2 sq-b3 sq-b4 sq-b5 sq-b6 - square
        sq-c1 sq-c2 sq-c3 sq-c4 sq-c5 sq-c6 - square
        sq-d1 sq-d2 sq-d3 sq-d4 sq-d5 sq-d6 - square
        sq-e1 sq-e2 sq-e3 sq-e4 sq-e5 sq-e6 - square
        sq-f1 sq-f2 sq-f3 sq-f4 sq-f5 sq-f6 - square
    )

    (:init

        (above sq-a1 sq-a2)
        (above sq-a2 sq-a3)
        (above sq-a3 sq-a4)
        (above sq-a4 sq-a5)
        (above sq-a5 sq-a6)
        (above sq-b1 sq-b2)
        (above sq-b2 sq-b3)
        (above sq-b3 sq-b4)
        (above sq-b4 sq-b5)
        (above sq-b5 sq-b6)
        (above sq-c1 sq-c2)
        (above sq-c2 sq-c3)
        (above sq-c3 sq-c4)
        (above sq-c4 sq-c5)
        (above sq-c5 sq-c6)
        (above sq-d1 sq-d2)
        (above sq-d2 sq-d3)
        (above sq-d3 sq-d4)
        (above sq-d4 sq-d5)
        (above sq-d5 sq-d6)
        (above sq-e1 sq-e2)
        (above sq-e2 sq-e3)
        (above sq-e3 sq-e4)
        (above sq-e4 sq-e5)
        (above sq-e5 sq-e6)
        (above sq-f1 sq-f2)
        (above sq-f2 sq-f3)
        (above sq-f3 sq-f4)
        (above sq-f4 sq-f5)
        (above sq-f5 sq-f6)

        (left-to sq-a1 sq-b1)
        (left-to sq-a2 sq-b2)
        (left-to sq-a3 sq-b3)
        (left-to sq-a4 sq-b4)
        (left-to sq-a5 sq-b5)
        (left-to sq-a6 sq-b6)
        (left-to sq-b1 sq-c1)
        (left-to sq-b2 sq-c2)
        (left-to sq-b3 sq-c3)
        (left-to sq-b4 sq-c4)
        (left-to sq-b5 sq-c5)
        (left-to sq-b6 sq-c6)
        (left-to sq-c1 sq-d1)
        (left-to sq-c2 sq-d2)
        (left-to sq-c3 sq-d3)
        (left-to sq-c4 sq-d4)
        (left-to sq-c5 sq-d5)
        (left-to sq-c6 sq-d6)
        (left-to sq-d1 sq-e1)
        (left-to sq-d2 sq-e2)
        (left-to sq-d3 sq-e3)
        (left-to sq-d4 sq-e4)
        (left-to sq-d5 sq-e5)
        (left-to sq-d6 sq-e6)
        (left-to sq-e1 sq-f1)
        (left-to sq-e2 sq-f2)
        (left-to sq-e3 sq-f3)
        (left-to sq-e4 sq-f4)
        (left-to sq-e5 sq-f5)
        (left-to sq-e6 sq-f6)

        (box-at sq-c3)
        (box-at sq-c4)

        (is-free sq-b2)
        (is-free sq-b3)
        (is-free sq-b5)
        (is-free sq-c2)
        (is-free sq-c5)
        (is-free sq-d2)
        (is-free sq-d3)
        (is-free sq-d5)
        (is-free sq-e3)
        (is-free sq-e4)
        (is-free sq-e5)

        (is-wall sq-a1)
        (is-wall sq-a2)
        (is-wall sq-a3)
        (is-wall sq-a4)
        (is-wall sq-a5)
        (is-wall sq-a6)
        (is-wall sq-b1)
        (is-wall sq-b4)
        (is-wall sq-b6)
        (is-wall sq-c1)
        (is-wall sq-c6)
        (is-wall sq-d1)
        (is-wall sq-d4)
        (is-wall sq-d6)
        (is-wall sq-e1)
        (is-wall sq-e6)
        (is-wall sq-f1)
        (is-wall sq-f2)
        (is-wall sq-f3)
        (is-wall sq-f4)
        (is-wall sq-f5)
        (is-wall sq-f6)



        (player-at sq-e2)



        (has-no-trampoline)
        (= (time) 5)
        (= (collected-coins) 0)
        (= (bombs-available) 0)
        (= (pliers-available) 0)
    )
    (:goal
        (and
            (box-at sq-b5)
            (box-at sq-c5)
        )
    )
)