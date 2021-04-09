(define (problem p69steps)
    (:domain sokoban)
    (:objects
        sq-a1 sq-a2 sq-a3 sq-a4 sq-a5 sq-a6 sq-a7 sq-a8 sq-a9 sq-a10 sq-a11 sq-a12 sq-a13 sq-a14 - square
        sq-b1 sq-b2 sq-b3 sq-b4 sq-b5 sq-b6 sq-b7 sq-b8 sq-b9 sq-b10 sq-b11 sq-b12 sq-b13 sq-b14 - square
        sq-c1 sq-c2 sq-c3 sq-c4 sq-c5 sq-c6 sq-c7 sq-c8 sq-c9 sq-c10 sq-c11 sq-c12 sq-c13 sq-c14 - square
        sq-d1 sq-d2 sq-d3 sq-d4 sq-d5 sq-d6 sq-d7 sq-d8 sq-d9 sq-d10 sq-d11 sq-d12 sq-d13 sq-d14 - square
        sq-e1 sq-e2 sq-e3 sq-e4 sq-e5 sq-e6 sq-e7 sq-e8 sq-e9 sq-e10 sq-e11 sq-e12 sq-e13 sq-e14 - square
        sq-f1 sq-f2 sq-f3 sq-f4 sq-f5 sq-f6 sq-f7 sq-f8 sq-f9 sq-f10 sq-f11 sq-f12 sq-f13 sq-f14 - square
        sq-g1 sq-g2 sq-g3 sq-g4 sq-g5 sq-g6 sq-g7 sq-g8 sq-g9 sq-g10 sq-g11 sq-g12 sq-g13 sq-g14 - square
        sq-h1 sq-h2 sq-h3 sq-h4 sq-h5 sq-h6 sq-h7 sq-h8 sq-h9 sq-h10 sq-h11 sq-h12 sq-h13 sq-h14 - square
        sq-i1 sq-i2 sq-i3 sq-i4 sq-i5 sq-i6 sq-i7 sq-i8 sq-i9 sq-i10 sq-i11 sq-i12 sq-i13 sq-i14 - square
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
        (above sq-a10 sq-a11)
        (above sq-a11 sq-a12)
        (above sq-a12 sq-a13)
        (above sq-a13 sq-a14)
        (above sq-b1 sq-b2)
        (above sq-b2 sq-b3)
        (above sq-b3 sq-b4)
        (above sq-b4 sq-b5)
        (above sq-b5 sq-b6)
        (above sq-b6 sq-b7)
        (above sq-b7 sq-b8)
        (above sq-b8 sq-b9)
        (above sq-b9 sq-b10)
        (above sq-b10 sq-b11)
        (above sq-b11 sq-b12)
        (above sq-b12 sq-b13)
        (above sq-b13 sq-b14)
        (above sq-c1 sq-c2)
        (above sq-c2 sq-c3)
        (above sq-c3 sq-c4)
        (above sq-c4 sq-c5)
        (above sq-c5 sq-c6)
        (above sq-c6 sq-c7)
        (above sq-c7 sq-c8)
        (above sq-c8 sq-c9)
        (above sq-c9 sq-c10)
        (above sq-c10 sq-c11)
        (above sq-c11 sq-c12)
        (above sq-c12 sq-c13)
        (above sq-c13 sq-c14)
        (above sq-d1 sq-d2)
        (above sq-d2 sq-d3)
        (above sq-d3 sq-d4)
        (above sq-d4 sq-d5)
        (above sq-d5 sq-d6)
        (above sq-d6 sq-d7)
        (above sq-d7 sq-d8)
        (above sq-d8 sq-d9)
        (above sq-d9 sq-d10)
        (above sq-d10 sq-d11)
        (above sq-d11 sq-d12)
        (above sq-d12 sq-d13)
        (above sq-d13 sq-d14)
        (above sq-e1 sq-e2)
        (above sq-e2 sq-e3)
        (above sq-e3 sq-e4)
        (above sq-e4 sq-e5)
        (above sq-e5 sq-e6)
        (above sq-e6 sq-e7)
        (above sq-e7 sq-e8)
        (above sq-e8 sq-e9)
        (above sq-e9 sq-e10)
        (above sq-e10 sq-e11)
        (above sq-e11 sq-e12)
        (above sq-e12 sq-e13)
        (above sq-e13 sq-e14)
        (above sq-f1 sq-f2)
        (above sq-f2 sq-f3)
        (above sq-f3 sq-f4)
        (above sq-f4 sq-f5)
        (above sq-f5 sq-f6)
        (above sq-f6 sq-f7)
        (above sq-f7 sq-f8)
        (above sq-f8 sq-f9)
        (above sq-f9 sq-f10)
        (above sq-f10 sq-f11)
        (above sq-f11 sq-f12)
        (above sq-f12 sq-f13)
        (above sq-f13 sq-f14)
        (above sq-g1 sq-g2)
        (above sq-g2 sq-g3)
        (above sq-g3 sq-g4)
        (above sq-g4 sq-g5)
        (above sq-g5 sq-g6)
        (above sq-g6 sq-g7)
        (above sq-g7 sq-g8)
        (above sq-g8 sq-g9)
        (above sq-g9 sq-g10)
        (above sq-g10 sq-g11)
        (above sq-g11 sq-g12)
        (above sq-g12 sq-g13)
        (above sq-g13 sq-g14)
        (above sq-h1 sq-h2)
        (above sq-h2 sq-h3)
        (above sq-h3 sq-h4)
        (above sq-h4 sq-h5)
        (above sq-h5 sq-h6)
        (above sq-h6 sq-h7)
        (above sq-h7 sq-h8)
        (above sq-h8 sq-h9)
        (above sq-h9 sq-h10)
        (above sq-h10 sq-h11)
        (above sq-h11 sq-h12)
        (above sq-h12 sq-h13)
        (above sq-h13 sq-h14)
        (above sq-i1 sq-i2)
        (above sq-i2 sq-i3)
        (above sq-i3 sq-i4)
        (above sq-i4 sq-i5)
        (above sq-i5 sq-i6)
        (above sq-i6 sq-i7)
        (above sq-i7 sq-i8)
        (above sq-i8 sq-i9)
        (above sq-i9 sq-i10)
        (above sq-i10 sq-i11)
        (above sq-i11 sq-i12)
        (above sq-i12 sq-i13)
        (above sq-i13 sq-i14)

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
        (left-to sq-a11 sq-b11)
        (left-to sq-a12 sq-b12)
        (left-to sq-a13 sq-b13)
        (left-to sq-a14 sq-b14)
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
        (left-to sq-b11 sq-c11)
        (left-to sq-b12 sq-c12)
        (left-to sq-b13 sq-c13)
        (left-to sq-b14 sq-c14)
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
        (left-to sq-c11 sq-d11)
        (left-to sq-c12 sq-d12)
        (left-to sq-c13 sq-d13)
        (left-to sq-c14 sq-d14)
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
        (left-to sq-d11 sq-e11)
        (left-to sq-d12 sq-e12)
        (left-to sq-d13 sq-e13)
        (left-to sq-d14 sq-e14)
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
        (left-to sq-e11 sq-f11)
        (left-to sq-e12 sq-f12)
        (left-to sq-e13 sq-f13)
        (left-to sq-e14 sq-f14)
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
        (left-to sq-f11 sq-g11)
        (left-to sq-f12 sq-g12)
        (left-to sq-f13 sq-g13)
        (left-to sq-f14 sq-g14)
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
        (left-to sq-g11 sq-h11)
        (left-to sq-g12 sq-h12)
        (left-to sq-g13 sq-h13)
        (left-to sq-g14 sq-h14)
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
        (left-to sq-h11 sq-i11)
        (left-to sq-h12 sq-i12)
        (left-to sq-h13 sq-i13)
        (left-to sq-h14 sq-i14)

        (box-at b1 sq-d10)
        (box-at b2 sq-e3)
        (box-at b3 sq-f10)

        (hole-at sq-d11)
        (hole-at sq-e4)
        (hole-at sq-f11)

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
        (no-hole-at sq-a11)
        (no-hole-at sq-a12)
        (no-hole-at sq-a13)
        (no-hole-at sq-a14)
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
        (no-hole-at sq-b11)
        (no-hole-at sq-b12)
        (no-hole-at sq-b13)
        (no-hole-at sq-b14)
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
        (no-hole-at sq-c11)
        (no-hole-at sq-c12)
        (no-hole-at sq-c13)
        (no-hole-at sq-c14)
        (no-hole-at sq-d1)
        (no-hole-at sq-d2)
        (no-hole-at sq-d3)
        (no-hole-at sq-d4)
        (no-hole-at sq-d5)
        (no-hole-at sq-d6)
        (no-hole-at sq-d7)
        (no-hole-at sq-d8)
        (no-hole-at sq-d9)
        (no-hole-at sq-d10)
        (no-hole-at sq-d12)
        (no-hole-at sq-d13)
        (no-hole-at sq-d14)
        (no-hole-at sq-e1)
        (no-hole-at sq-e2)
        (no-hole-at sq-e3)
        (no-hole-at sq-e5)
        (no-hole-at sq-e6)
        (no-hole-at sq-e7)
        (no-hole-at sq-e8)
        (no-hole-at sq-e9)
        (no-hole-at sq-e10)
        (no-hole-at sq-e11)
        (no-hole-at sq-e12)
        (no-hole-at sq-e13)
        (no-hole-at sq-e14)
        (no-hole-at sq-f1)
        (no-hole-at sq-f2)
        (no-hole-at sq-f3)
        (no-hole-at sq-f4)
        (no-hole-at sq-f5)
        (no-hole-at sq-f6)
        (no-hole-at sq-f7)
        (no-hole-at sq-f8)
        (no-hole-at sq-f9)
        (no-hole-at sq-f10)
        (no-hole-at sq-f12)
        (no-hole-at sq-f13)
        (no-hole-at sq-f14)
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
        (no-hole-at sq-g11)
        (no-hole-at sq-g12)
        (no-hole-at sq-g13)
        (no-hole-at sq-g14)
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
        (no-hole-at sq-h11)
        (no-hole-at sq-h12)
        (no-hole-at sq-h13)
        (no-hole-at sq-h14)
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
        (no-hole-at sq-i11)
        (no-hole-at sq-i12)
        (no-hole-at sq-i13)
        (no-hole-at sq-i14)

        (is-free sq-a1)
        (is-free sq-a2)
        (is-free sq-a3)
        (is-free sq-a11)
        (is-free sq-a12)
        (is-free sq-a13)
        (is-free sq-a14)
        (is-free sq-b1)
        (is-free sq-b2)
        (is-free sq-b5)
        (is-free sq-b6)
        (is-free sq-b7)
        (is-free sq-b8)
        (is-free sq-b9)
        (is-free sq-b12)
        (is-free sq-b13)
        (is-free sq-b14)
        (is-free sq-c1)
        (is-free sq-c2)
        (is-free sq-c4)
        (is-free sq-c5)
        (is-free sq-c9)
        (is-free sq-c10)
        (is-free sq-d4)
        (is-free sq-d6)
        (is-free sq-d7)
        (is-free sq-d8)
        (is-free sq-d11)
        (is-free sq-d12)
        (is-free sq-d13)
        (is-free sq-e4)
        (is-free sq-e5)
        (is-free sq-e6)
        (is-free sq-e7)
        (is-free sq-e8)
        (is-free sq-e9)
        (is-free sq-e10)
        (is-free sq-e11)
        (is-free sq-e12)
        (is-free sq-e13)
        (is-free sq-f4)
        (is-free sq-f6)
        (is-free sq-f7)
        (is-free sq-f8)
        (is-free sq-f11)
        (is-free sq-f12)
        (is-free sq-f13)
        (is-free sq-g1)
        (is-free sq-g2)
        (is-free sq-g4)
        (is-free sq-g5)
        (is-free sq-g9)
        (is-free sq-g10)
        (is-free sq-h1)
        (is-free sq-h2)
        (is-free sq-h5)
        (is-free sq-h6)
        (is-free sq-h7)
        (is-free sq-h8)
        (is-free sq-h9)
        (is-free sq-h12)
        (is-free sq-h13)
        (is-free sq-h14)
        (is-free sq-i1)
        (is-free sq-i2)
        (is-free sq-i3)
        (is-free sq-i11)
        (is-free sq-i12)
        (is-free sq-i13)
        (is-free sq-i14)

        (is-wall sq-a4)
        (is-wall sq-a5)
        (is-wall sq-a6)
        (is-wall sq-a7)
        (is-wall sq-a8)
        (is-wall sq-a9)
        (is-wall sq-a10)
        (is-wall sq-b3)
        (is-wall sq-b4)
        (is-wall sq-b10)
        (is-wall sq-b11)
        (is-wall sq-c3)
        (is-wall sq-c6)
        (is-wall sq-c7)
        (is-wall sq-c8)
        (is-wall sq-c11)
        (is-wall sq-c12)
        (is-wall sq-c13)
        (is-wall sq-c14)
        (is-wall sq-d1)
        (is-wall sq-d2)
        (is-wall sq-d3)
        (is-wall sq-d5)
        (is-wall sq-d9)
        (is-wall sq-d14)
        (is-wall sq-e1)
        (is-wall sq-e14)
        (is-wall sq-f1)
        (is-wall sq-f2)
        (is-wall sq-f3)
        (is-wall sq-f5)
        (is-wall sq-f9)
        (is-wall sq-f14)
        (is-wall sq-g3)
        (is-wall sq-g6)
        (is-wall sq-g7)
        (is-wall sq-g8)
        (is-wall sq-g11)
        (is-wall sq-g12)
        (is-wall sq-g13)
        (is-wall sq-g14)
        (is-wall sq-h3)
        (is-wall sq-h4)
        (is-wall sq-h10)
        (is-wall sq-h11)
        (is-wall sq-i4)
        (is-wall sq-i5)
        (is-wall sq-i6)
        (is-wall sq-i7)
        (is-wall sq-i8)
        (is-wall sq-i9)
        (is-wall sq-i10)



        (player-at p1 sq-e2)



        (has-no-trampoline)
        (= (total-cost) 0)
        (= (collected-coins) 0)
        (= (bombs-available p1) 0)
        (= (pliers-available p1) 10)
    )

    (:goal (and 
       (forall (?b - box) (collected-box ?b))
        ; (> (collected-coins) 0)
        (preference  (> (collected-coins) 0))
     )
    )

    (:metric minimize (-(total-cost) (collected-coins)))
)