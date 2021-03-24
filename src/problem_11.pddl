; Microban 84
(define (problem p201steps)
    (:domain sokoban)
    (:objects
        sq-a1 sq-a2 sq-a3 sq-a4 sq-a5 sq-a6 sq-a7 sq-a8 sq-a9 sq-a10 - square
        sq-b1 sq-b2 sq-b3 sq-b4 sq-b5 sq-b6 sq-b7 sq-b8 sq-b9 sq-b10 - square
        sq-c1 sq-c2 sq-c3 sq-c4 sq-c5 sq-c6 sq-c7 sq-c8 sq-c9 sq-c10 - square
        sq-d1 sq-d2 sq-d3 sq-d4 sq-d5 sq-d6 sq-d7 sq-d8 sq-d9 sq-d10 - square
        sq-e1 sq-e2 sq-e3 sq-e4 sq-e5 sq-e6 sq-e7 sq-e8 sq-e9 sq-e10 - square
        sq-f1 sq-f2 sq-f3 sq-f4 sq-f5 sq-f6 sq-f7 sq-f8 sq-f9 sq-f10 - square
        sq-g1 sq-g2 sq-g3 sq-g4 sq-g5 sq-g6 sq-g7 sq-g8 sq-g9 sq-g10 - square
        sq-h1 sq-h2 sq-h3 sq-h4 sq-h5 sq-h6 sq-h7 sq-h8 sq-h9 sq-h10 - square
        sq-i1 sq-i2 sq-i3 sq-i4 sq-i5 sq-i6 sq-i7 sq-i8 sq-i9 sq-i10 - square
        sq-j1 sq-j2 sq-j3 sq-j4 sq-j5 sq-j6 sq-j7 sq-j8 sq-j9 sq-j10 - square
        sq-k1 sq-k2 sq-k3 sq-k4 sq-k5 sq-k6 sq-k7 sq-k8 sq-k9 sq-k10 - square
        sq-l1 sq-l2 sq-l3 sq-l4 sq-l5 sq-l6 sq-l7 sq-l8 sq-l9 sq-l10 - square
        b1 b2 b3 - box
    )

    (:init

        (above sq-a1 sq-a2)
        (above sq-a2 sq-a3)
        (above sq-a3 sq-a4)
        (above sq-a4 sq-a5)
        (above sq-a5 sq-a6)
        (above sq-a6 sq-a7)
        (above sq-a7 sq-a8)
        (above sq-a8 sq-a9)
        (above sq-a9 sq-a10)
        (above sq-b1 sq-b2)
        (above sq-b2 sq-b3)
        (above sq-b3 sq-b4)
        (above sq-b4 sq-b5)
        (above sq-b5 sq-b6)
        (above sq-b6 sq-b7)
        (above sq-b7 sq-b8)
        (above sq-b8 sq-b9)
        (above sq-b9 sq-b10)
        (above sq-c1 sq-c2)
        (above sq-c2 sq-c3)
        (above sq-c3 sq-c4)
        (above sq-c4 sq-c5)
        (above sq-c5 sq-c6)
        (above sq-c6 sq-c7)
        (above sq-c7 sq-c8)
        (above sq-c8 sq-c9)
        (above sq-c9 sq-c10)
        (above sq-d1 sq-d2)
        (above sq-d2 sq-d3)
        (above sq-d3 sq-d4)
        (above sq-d4 sq-d5)
        (above sq-d5 sq-d6)
        (above sq-d6 sq-d7)
        (above sq-d7 sq-d8)
        (above sq-d8 sq-d9)
        (above sq-d9 sq-d10)
        (above sq-e1 sq-e2)
        (above sq-e2 sq-e3)
        (above sq-e3 sq-e4)
        (above sq-e4 sq-e5)
        (above sq-e5 sq-e6)
        (above sq-e6 sq-e7)
        (above sq-e7 sq-e8)
        (above sq-e8 sq-e9)
        (above sq-e9 sq-e10)
        (above sq-f1 sq-f2)
        (above sq-f2 sq-f3)
        (above sq-f3 sq-f4)
        (above sq-f4 sq-f5)
        (above sq-f5 sq-f6)
        (above sq-f6 sq-f7)
        (above sq-f7 sq-f8)
        (above sq-f8 sq-f9)
        (above sq-f9 sq-f10)
        (above sq-g1 sq-g2)
        (above sq-g2 sq-g3)
        (above sq-g3 sq-g4)
        (above sq-g4 sq-g5)
        (above sq-g5 sq-g6)
        (above sq-g6 sq-g7)
        (above sq-g7 sq-g8)
        (above sq-g8 sq-g9)
        (above sq-g9 sq-g10)
        (above sq-h1 sq-h2)
        (above sq-h2 sq-h3)
        (above sq-h3 sq-h4)
        (above sq-h4 sq-h5)
        (above sq-h5 sq-h6)
        (above sq-h6 sq-h7)
        (above sq-h7 sq-h8)
        (above sq-h8 sq-h9)
        (above sq-h9 sq-h10)
        (above sq-i1 sq-i2)
        (above sq-i2 sq-i3)
        (above sq-i3 sq-i4)
        (above sq-i4 sq-i5)
        (above sq-i5 sq-i6)
        (above sq-i6 sq-i7)
        (above sq-i7 sq-i8)
        (above sq-i8 sq-i9)
        (above sq-i9 sq-i10)
        (above sq-j1 sq-j2)
        (above sq-j2 sq-j3)
        (above sq-j3 sq-j4)
        (above sq-j4 sq-j5)
        (above sq-j5 sq-j6)
        (above sq-j6 sq-j7)
        (above sq-j7 sq-j8)
        (above sq-j8 sq-j9)
        (above sq-j9 sq-j10)
        (above sq-k1 sq-k2)
        (above sq-k2 sq-k3)
        (above sq-k3 sq-k4)
        (above sq-k4 sq-k5)
        (above sq-k5 sq-k6)
        (above sq-k6 sq-k7)
        (above sq-k7 sq-k8)
        (above sq-k8 sq-k9)
        (above sq-k9 sq-k10)
        (above sq-l1 sq-l2)
        (above sq-l2 sq-l3)
        (above sq-l3 sq-l4)
        (above sq-l4 sq-l5)
        (above sq-l5 sq-l6)
        (above sq-l6 sq-l7)
        (above sq-l7 sq-l8)
        (above sq-l8 sq-l9)
        (above sq-l9 sq-l10)

        (left-to sq-a1 sq-b1)
        (left-to sq-a2 sq-b2)
        (left-to sq-a3 sq-b3)
        (left-to sq-a4 sq-b4)
        (left-to sq-a5 sq-b5)
        (left-to sq-a6 sq-b6)
        (left-to sq-a7 sq-b7)
        (left-to sq-a8 sq-b8)
        (left-to sq-a9 sq-b9)
        (left-to sq-a10 sq-b10)
        (left-to sq-b1 sq-c1)
        (left-to sq-b2 sq-c2)
        (left-to sq-b3 sq-c3)
        (left-to sq-b4 sq-c4)
        (left-to sq-b5 sq-c5)
        (left-to sq-b6 sq-c6)
        (left-to sq-b7 sq-c7)
        (left-to sq-b8 sq-c8)
        (left-to sq-b9 sq-c9)
        (left-to sq-b10 sq-c10)
        (left-to sq-c1 sq-d1)
        (left-to sq-c2 sq-d2)
        (left-to sq-c3 sq-d3)
        (left-to sq-c4 sq-d4)
        (left-to sq-c5 sq-d5)
        (left-to sq-c6 sq-d6)
        (left-to sq-c7 sq-d7)
        (left-to sq-c8 sq-d8)
        (left-to sq-c9 sq-d9)
        (left-to sq-c10 sq-d10)
        (left-to sq-d1 sq-e1)
        (left-to sq-d2 sq-e2)
        (left-to sq-d3 sq-e3)
        (left-to sq-d4 sq-e4)
        (left-to sq-d5 sq-e5)
        (left-to sq-d6 sq-e6)
        (left-to sq-d7 sq-e7)
        (left-to sq-d8 sq-e8)
        (left-to sq-d9 sq-e9)
        (left-to sq-d10 sq-e10)
        (left-to sq-e1 sq-f1)
        (left-to sq-e2 sq-f2)
        (left-to sq-e3 sq-f3)
        (left-to sq-e4 sq-f4)
        (left-to sq-e5 sq-f5)
        (left-to sq-e6 sq-f6)
        (left-to sq-e7 sq-f7)
        (left-to sq-e8 sq-f8)
        (left-to sq-e9 sq-f9)
        (left-to sq-e10 sq-f10)
        (left-to sq-f1 sq-g1)
        (left-to sq-f2 sq-g2)
        (left-to sq-f3 sq-g3)
        (left-to sq-f4 sq-g4)
        (left-to sq-f5 sq-g5)
        (left-to sq-f6 sq-g6)
        (left-to sq-f7 sq-g7)
        (left-to sq-f8 sq-g8)
        (left-to sq-f9 sq-g9)
        (left-to sq-f10 sq-g10)
        (left-to sq-g1 sq-h1)
        (left-to sq-g2 sq-h2)
        (left-to sq-g3 sq-h3)
        (left-to sq-g4 sq-h4)
        (left-to sq-g5 sq-h5)
        (left-to sq-g6 sq-h6)
        (left-to sq-g7 sq-h7)
        (left-to sq-g8 sq-h8)
        (left-to sq-g9 sq-h9)
        (left-to sq-g10 sq-h10)
        (left-to sq-h1 sq-i1)
        (left-to sq-h2 sq-i2)
        (left-to sq-h3 sq-i3)
        (left-to sq-h4 sq-i4)
        (left-to sq-h5 sq-i5)
        (left-to sq-h6 sq-i6)
        (left-to sq-h7 sq-i7)
        (left-to sq-h8 sq-i8)
        (left-to sq-h9 sq-i9)
        (left-to sq-h10 sq-i10)
        (left-to sq-i1 sq-j1)
        (left-to sq-i2 sq-j2)
        (left-to sq-i3 sq-j3)
        (left-to sq-i4 sq-j4)
        (left-to sq-i5 sq-j5)
        (left-to sq-i6 sq-j6)
        (left-to sq-i7 sq-j7)
        (left-to sq-i8 sq-j8)
        (left-to sq-i9 sq-j9)
        (left-to sq-i10 sq-j10)
        (left-to sq-j1 sq-k1)
        (left-to sq-j2 sq-k2)
        (left-to sq-j3 sq-k3)
        (left-to sq-j4 sq-k4)
        (left-to sq-j5 sq-k5)
        (left-to sq-j6 sq-k6)
        (left-to sq-j7 sq-k7)
        (left-to sq-j8 sq-k8)
        (left-to sq-j9 sq-k9)
        (left-to sq-j10 sq-k10)
        (left-to sq-k1 sq-l1)
        (left-to sq-k2 sq-l2)
        (left-to sq-k3 sq-l3)
        (left-to sq-k4 sq-l4)
        (left-to sq-k5 sq-l5)
        (left-to sq-k6 sq-l6)
        (left-to sq-k7 sq-l7)
        (left-to sq-k8 sq-l8)
        (left-to sq-k9 sq-l9)
        (left-to sq-k10 sq-l10)

        (box-at b1 sq-f4)
        (box-at b2 sq-f5)
        (box-at b3 sq-f6)

        (hole-at sq-d2)
        (hole-at sq-e2)
        (hole-at sq-f2)

        (no-hole-at sq-a1)
        (no-hole-at sq-a2)
        (no-hole-at sq-a3)
        (no-hole-at sq-a4)
        (no-hole-at sq-a5)
        (no-hole-at sq-a6)
        (no-hole-at sq-a7)
        (no-hole-at sq-a8)
        (no-hole-at sq-a9)
        (no-hole-at sq-a10)
        (no-hole-at sq-b1)
        (no-hole-at sq-b2)
        (no-hole-at sq-b3)
        (no-hole-at sq-b4)
        (no-hole-at sq-b5)
        (no-hole-at sq-b6)
        (no-hole-at sq-b7)
        (no-hole-at sq-b8)
        (no-hole-at sq-b9)
        (no-hole-at sq-b10)
        (no-hole-at sq-c1)
        (no-hole-at sq-c2)
        (no-hole-at sq-c3)
        (no-hole-at sq-c4)
        (no-hole-at sq-c5)
        (no-hole-at sq-c6)
        (no-hole-at sq-c7)
        (no-hole-at sq-c8)
        (no-hole-at sq-c9)
        (no-hole-at sq-c10)
        (no-hole-at sq-d1)
        (no-hole-at sq-d3)
        (no-hole-at sq-d4)
        (no-hole-at sq-d5)
        (no-hole-at sq-d6)
        (no-hole-at sq-d7)
        (no-hole-at sq-d8)
        (no-hole-at sq-d9)
        (no-hole-at sq-d10)
        (no-hole-at sq-e1)
        (no-hole-at sq-e3)
        (no-hole-at sq-e4)
        (no-hole-at sq-e5)
        (no-hole-at sq-e6)
        (no-hole-at sq-e7)
        (no-hole-at sq-e8)
        (no-hole-at sq-e9)
        (no-hole-at sq-e10)
        (no-hole-at sq-f1)
        (no-hole-at sq-f3)
        (no-hole-at sq-f4)
        (no-hole-at sq-f5)
        (no-hole-at sq-f6)
        (no-hole-at sq-f7)
        (no-hole-at sq-f8)
        (no-hole-at sq-f9)
        (no-hole-at sq-f10)
        (no-hole-at sq-g1)
        (no-hole-at sq-g2)
        (no-hole-at sq-g3)
        (no-hole-at sq-g4)
        (no-hole-at sq-g5)
        (no-hole-at sq-g6)
        (no-hole-at sq-g7)
        (no-hole-at sq-g8)
        (no-hole-at sq-g9)
        (no-hole-at sq-g10)
        (no-hole-at sq-h1)
        (no-hole-at sq-h2)
        (no-hole-at sq-h3)
        (no-hole-at sq-h4)
        (no-hole-at sq-h5)
        (no-hole-at sq-h6)
        (no-hole-at sq-h7)
        (no-hole-at sq-h8)
        (no-hole-at sq-h9)
        (no-hole-at sq-h10)
        (no-hole-at sq-i1)
        (no-hole-at sq-i2)
        (no-hole-at sq-i3)
        (no-hole-at sq-i4)
        (no-hole-at sq-i5)
        (no-hole-at sq-i6)
        (no-hole-at sq-i7)
        (no-hole-at sq-i8)
        (no-hole-at sq-i9)
        (no-hole-at sq-i10)
        (no-hole-at sq-j1)
        (no-hole-at sq-j2)
        (no-hole-at sq-j3)
        (no-hole-at sq-j4)
        (no-hole-at sq-j5)
        (no-hole-at sq-j6)
        (no-hole-at sq-j7)
        (no-hole-at sq-j8)
        (no-hole-at sq-j9)
        (no-hole-at sq-j10)
        (no-hole-at sq-k1)
        (no-hole-at sq-k2)
        (no-hole-at sq-k3)
        (no-hole-at sq-k4)
        (no-hole-at sq-k5)
        (no-hole-at sq-k6)
        (no-hole-at sq-k7)
        (no-hole-at sq-k8)
        (no-hole-at sq-k9)
        (no-hole-at sq-k10)
        (no-hole-at sq-l1)
        (no-hole-at sq-l2)
        (no-hole-at sq-l3)
        (no-hole-at sq-l4)
        (no-hole-at sq-l5)
        (no-hole-at sq-l6)
        (no-hole-at sq-l7)
        (no-hole-at sq-l8)
        (no-hole-at sq-l9)
        (no-hole-at sq-l10)

        (is-free sq-a6)
        (is-free sq-a7)
        (is-free sq-a8)
        (is-free sq-a9)
        (is-free sq-a10)
        (is-free sq-b2)
        (is-free sq-b3)
        (is-free sq-b4)
        (is-free sq-c2)
        (is-free sq-c3)
        (is-free sq-c4)
        (is-free sq-c5)
        (is-free sq-c6)
        (is-free sq-c7)
        (is-free sq-c8)
        (is-free sq-c9)
        (is-free sq-d2)
        (is-free sq-d8)
        (is-free sq-d9)
        (is-free sq-e2)
        (is-free sq-e4)
        (is-free sq-e6)
        (is-free sq-e8)
        (is-free sq-e9)
        (is-free sq-f2)
        (is-free sq-f8)
        (is-free sq-g2)
        (is-free sq-g3)
        (is-free sq-g4)
        (is-free sq-g5)
        (is-free sq-g6)
        (is-free sq-g7)
        (is-free sq-g8)
        (is-free sq-g10)
        (is-free sq-h4)
        (is-free sq-h5)
        (is-free sq-h6)
        (is-free sq-h8)
        (is-free sq-i1)
        (is-free sq-i2)
        (is-free sq-i8)
        (is-free sq-i9)
        (is-free sq-j1)
        (is-free sq-j2)
        (is-free sq-j3)
        (is-free sq-j4)
        (is-free sq-j5)
        (is-free sq-j6)
        (is-free sq-j8)
        (is-free sq-j9)
        (is-free sq-k1)
        (is-free sq-k2)
        (is-free sq-k3)
        (is-free sq-k4)
        (is-free sq-k5)
        (is-free sq-k6)
        (is-free sq-k8)
        (is-free sq-k9)
        (is-free sq-l1)
        (is-free sq-l2)
        (is-free sq-l3)
        (is-free sq-l4)
        (is-free sq-l5)
        (is-free sq-l6)

        (is-wall sq-a1)
        (is-wall sq-a2)
        (is-wall sq-a3)
        (is-wall sq-a4)
        (is-wall sq-a5)
        (is-wall sq-b1)
        (is-wall sq-b5)
        (is-wall sq-b6)
        (is-wall sq-b7)
        (is-wall sq-b8)
        (is-wall sq-b9)
        (is-wall sq-b10)
        (is-wall sq-c1)
        (is-wall sq-c10)
        (is-wall sq-d1)
        (is-wall sq-d3)
        (is-wall sq-d4)
        (is-wall sq-d5)
        (is-wall sq-d6)
        (is-wall sq-d7)
        (is-wall sq-d10)
        (is-wall sq-e1)
        (is-wall sq-e3)
        (is-wall sq-e7)
        (is-wall sq-e10)
        (is-wall sq-f1)
        (is-wall sq-f3)
        (is-wall sq-f7)
        (is-wall sq-f9)
        (is-wall sq-f10)
        (is-wall sq-g1)
        (is-wall sq-g9)
        (is-wall sq-h1)
        (is-wall sq-h2)
        (is-wall sq-h3)
        (is-wall sq-h7)
        (is-wall sq-h9)
        (is-wall sq-h10)
        (is-wall sq-i3)
        (is-wall sq-i4)
        (is-wall sq-i5)
        (is-wall sq-i6)
        (is-wall sq-i7)
        (is-wall sq-i10)
        (is-wall sq-j7)
        (is-wall sq-j10)
        (is-wall sq-k7)
        (is-wall sq-k10)
        (is-wall sq-l7)
        (is-wall sq-l8)
        (is-wall sq-l9)
        (is-wall sq-l10)



        (player-at p1 sq-e5)



        (has-no-trampoline)
        (= (total-cost) 0)
        (= (collected-coins) 0)
        (= (bombs-available p1) 0)
        (= (pliers-available p1) 0)
    )
    (:goal
        (and
            (collected-box b1)
            (collected-box b2)
            (collected-box b3)

            (preference (> (collected-coins) 0))
        )
    )
    (:metric minimize (- (total-cost) (collected-coins)))
)
)