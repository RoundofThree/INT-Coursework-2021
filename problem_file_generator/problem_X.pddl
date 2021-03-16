(define (problem problem_X)
    (:domain sokoban)
    (:objects
        sq-a1 sq-a2 sq-a3 sq-a4 sq-a5 sq-a6 sq-a7 sq-a8 - square
        sq-b1 sq-b2 sq-b3 sq-b4 sq-b5 sq-b6 sq-b7 sq-b8 - square
        sq-c1 sq-c2 sq-c3 sq-c4 sq-c5 sq-c6 sq-c7 sq-c8 - square
        sq-d1 sq-d2 sq-d3 sq-d4 sq-d5 sq-d6 sq-d7 sq-d8 - square
        sq-e1 sq-e2 sq-e3 sq-e4 sq-e5 sq-e6 sq-e7 sq-e8 - square
        sq-f1 sq-f2 sq-f3 sq-f4 sq-f5 sq-f6 sq-f7 sq-f8 - square
        sq-g1 sq-g2 sq-g3 sq-g4 sq-g5 sq-g6 sq-g7 sq-g8 - square
        sq-h1 sq-h2 sq-h3 sq-h4 sq-h5 sq-h6 sq-h7 sq-h8 - square
        sq-i1 sq-i2 sq-i3 sq-i4 sq-i5 sq-i6 sq-i7 sq-i8 - square
        b1 b2 b3 b4 b5 - box
    )

    (:init

        (above sq-a1 sq-a2)
        (above sq-a2 sq-a3)
        (above sq-a3 sq-a4)
        (above sq-a4 sq-a5)
        (above sq-a5 sq-a6)
        (above sq-a6 sq-a7)
        (above sq-a7 sq-a8)
        (above sq-b1 sq-b2)
        (above sq-b2 sq-b3)
        (above sq-b3 sq-b4)
        (above sq-b4 sq-b5)
        (above sq-b5 sq-b6)
        (above sq-b6 sq-b7)
        (above sq-b7 sq-b8)
        (above sq-c1 sq-c2)
        (above sq-c2 sq-c3)
        (above sq-c3 sq-c4)
        (above sq-c4 sq-c5)
        (above sq-c5 sq-c6)
        (above sq-c6 sq-c7)
        (above sq-c7 sq-c8)
        (above sq-d1 sq-d2)
        (above sq-d2 sq-d3)
        (above sq-d3 sq-d4)
        (above sq-d4 sq-d5)
        (above sq-d5 sq-d6)
        (above sq-d6 sq-d7)
        (above sq-d7 sq-d8)
        (above sq-e1 sq-e2)
        (above sq-e2 sq-e3)
        (above sq-e3 sq-e4)
        (above sq-e4 sq-e5)
        (above sq-e5 sq-e6)
        (above sq-e6 sq-e7)
        (above sq-e7 sq-e8)
        (above sq-f1 sq-f2)
        (above sq-f2 sq-f3)
        (above sq-f3 sq-f4)
        (above sq-f4 sq-f5)
        (above sq-f5 sq-f6)
        (above sq-f6 sq-f7)
        (above sq-f7 sq-f8)
        (above sq-g1 sq-g2)
        (above sq-g2 sq-g3)
        (above sq-g3 sq-g4)
        (above sq-g4 sq-g5)
        (above sq-g5 sq-g6)
        (above sq-g6 sq-g7)
        (above sq-g7 sq-g8)
        (above sq-h1 sq-h2)
        (above sq-h2 sq-h3)
        (above sq-h3 sq-h4)
        (above sq-h4 sq-h5)
        (above sq-h5 sq-h6)
        (above sq-h6 sq-h7)
        (above sq-h7 sq-h8)
        (above sq-i1 sq-i2)
        (above sq-i2 sq-i3)
        (above sq-i3 sq-i4)
        (above sq-i4 sq-i5)
        (above sq-i5 sq-i6)
        (above sq-i6 sq-i7)
        (above sq-i7 sq-i8)

        (left-to sq-a1 sq-b1)
        (left-to sq-a2 sq-b2)
        (left-to sq-a3 sq-b3)
        (left-to sq-a4 sq-b4)
        (left-to sq-a5 sq-b5)
        (left-to sq-a6 sq-b6)
        (left-to sq-a7 sq-b7)
        (left-to sq-a8 sq-b8)
        (left-to sq-b1 sq-c1)
        (left-to sq-b2 sq-c2)
        (left-to sq-b3 sq-c3)
        (left-to sq-b4 sq-c4)
        (left-to sq-b5 sq-c5)
        (left-to sq-b6 sq-c6)
        (left-to sq-b7 sq-c7)
        (left-to sq-b8 sq-c8)
        (left-to sq-c1 sq-d1)
        (left-to sq-c2 sq-d2)
        (left-to sq-c3 sq-d3)
        (left-to sq-c4 sq-d4)
        (left-to sq-c5 sq-d5)
        (left-to sq-c6 sq-d6)
        (left-to sq-c7 sq-d7)
        (left-to sq-c8 sq-d8)
        (left-to sq-d1 sq-e1)
        (left-to sq-d2 sq-e2)
        (left-to sq-d3 sq-e3)
        (left-to sq-d4 sq-e4)
        (left-to sq-d5 sq-e5)
        (left-to sq-d6 sq-e6)
        (left-to sq-d7 sq-e7)
        (left-to sq-d8 sq-e8)
        (left-to sq-e1 sq-f1)
        (left-to sq-e2 sq-f2)
        (left-to sq-e3 sq-f3)
        (left-to sq-e4 sq-f4)
        (left-to sq-e5 sq-f5)
        (left-to sq-e6 sq-f6)
        (left-to sq-e7 sq-f7)
        (left-to sq-e8 sq-f8)
        (left-to sq-f1 sq-g1)
        (left-to sq-f2 sq-g2)
        (left-to sq-f3 sq-g3)
        (left-to sq-f4 sq-g4)
        (left-to sq-f5 sq-g5)
        (left-to sq-f6 sq-g6)
        (left-to sq-f7 sq-g7)
        (left-to sq-f8 sq-g8)
        (left-to sq-g1 sq-h1)
        (left-to sq-g2 sq-h2)
        (left-to sq-g3 sq-h3)
        (left-to sq-g4 sq-h4)
        (left-to sq-g5 sq-h5)
        (left-to sq-g6 sq-h6)
        (left-to sq-g7 sq-h7)
        (left-to sq-g8 sq-h8)
        (left-to sq-h1 sq-i1)
        (left-to sq-h2 sq-i2)
        (left-to sq-h3 sq-i3)
        (left-to sq-h4 sq-i4)
        (left-to sq-h5 sq-i5)
        (left-to sq-h6 sq-i6)
        (left-to sq-h7 sq-i7)
        (left-to sq-h8 sq-i8)

        (box-at b1 sq-d3)
        (box-at b2 sq-d4)
        (box-at b3 sq-d5)
        (box-at b4 sq-d7)
        (box-at b5 sq-g4)

        (hole-at sq-c5)
        (hole-at sq-c7)
        (hole-at sq-d3)
        (hole-at sq-e5)
        (hole-at sq-e7)

        (no-hole-at sq-a1)
        (no-hole-at sq-a2)
        (no-hole-at sq-a3)
        (no-hole-at sq-a4)
        (no-hole-at sq-a5)
        (no-hole-at sq-a6)
        (no-hole-at sq-a7)
        (no-hole-at sq-a8)
        (no-hole-at sq-b1)
        (no-hole-at sq-b2)
        (no-hole-at sq-b3)
        (no-hole-at sq-b4)
        (no-hole-at sq-b5)
        (no-hole-at sq-b6)
        (no-hole-at sq-b7)
        (no-hole-at sq-b8)
        (no-hole-at sq-c1)
        (no-hole-at sq-c2)
        (no-hole-at sq-c3)
        (no-hole-at sq-c4)
        (no-hole-at sq-c6)
        (no-hole-at sq-c8)
        (no-hole-at sq-d1)
        (no-hole-at sq-d2)
        (no-hole-at sq-d4)
        (no-hole-at sq-d5)
        (no-hole-at sq-d6)
        (no-hole-at sq-d7)
        (no-hole-at sq-d8)
        (no-hole-at sq-e1)
        (no-hole-at sq-e2)
        (no-hole-at sq-e3)
        (no-hole-at sq-e4)
        (no-hole-at sq-e6)
        (no-hole-at sq-e8)
        (no-hole-at sq-f1)
        (no-hole-at sq-f2)
        (no-hole-at sq-f3)
        (no-hole-at sq-f4)
        (no-hole-at sq-f5)
        (no-hole-at sq-f6)
        (no-hole-at sq-f7)
        (no-hole-at sq-f8)
        (no-hole-at sq-g1)
        (no-hole-at sq-g2)
        (no-hole-at sq-g3)
        (no-hole-at sq-g4)
        (no-hole-at sq-g5)
        (no-hole-at sq-g6)
        (no-hole-at sq-g7)
        (no-hole-at sq-g8)
        (no-hole-at sq-h1)
        (no-hole-at sq-h2)
        (no-hole-at sq-h3)
        (no-hole-at sq-h4)
        (no-hole-at sq-h5)
        (no-hole-at sq-h6)
        (no-hole-at sq-h7)
        (no-hole-at sq-h8)
        (no-hole-at sq-i1)
        (no-hole-at sq-i2)
        (no-hole-at sq-i3)
        (no-hole-at sq-i4)
        (no-hole-at sq-i5)
        (no-hole-at sq-i6)
        (no-hole-at sq-i7)
        (no-hole-at sq-i8)

        (is-free sq-b4)
        (is-free sq-b5)
        (is-free sq-b7)
        (is-free sq-c4)
        (is-free sq-d2)
        (is-free sq-d6)
        (is-free sq-e2)
        (is-free sq-e3)
        (is-free sq-e4)
        (is-free sq-f4)
        (is-free sq-f5)
        (is-free sq-f6)
        (is-free sq-f7)
        (is-free sq-g7)
        (is-free sq-h4)
        (is-free sq-h5)
        (is-free sq-h6)
        (is-free sq-h7)

        (is-wall sq-a3)
        (is-wall sq-a4)
        (is-wall sq-a5)
        (is-wall sq-a6)
        (is-wall sq-a7)
        (is-wall sq-a8)
        (is-wall sq-b3)
        (is-wall sq-b8)
        (is-wall sq-c1)
        (is-wall sq-c2)
        (is-wall sq-c3)
        (is-wall sq-c6)
        (is-wall sq-c8)
        (is-wall sq-d1)
        (is-wall sq-d8)
        (is-wall sq-e1)
        (is-wall sq-e6)
        (is-wall sq-e8)
        (is-wall sq-f1)
        (is-wall sq-f2)
        (is-wall sq-f3)
        (is-wall sq-f8)
        (is-wall sq-g3)
        (is-wall sq-g5)
        (is-wall sq-g6)
        (is-wall sq-g8)
        (is-wall sq-h3)
        (is-wall sq-h8)
        (is-wall sq-i3)
        (is-wall sq-i4)
        (is-wall sq-i5)
        (is-wall sq-i6)
        (is-wall sq-i7)
        (is-wall sq-i8)



        (player-at p1 sq-b6)


        (collected-box b1)

        (has-no-trampoline)
        (= (time) 5)
        (= (collected-coins) 0)
        (= (bombs-available p1) 10)
        (= (pliers-available p1) 10)
    )
    (:goal
        (and
            (collected-box b1)
            (collected-box b2)
            (collected-box b3)
            (collected-box b4)
            (collected-box b5)
        )
    )
)