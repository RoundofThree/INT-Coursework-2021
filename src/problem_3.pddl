(define (problem problem_3) (:domain sokoban)
(:objects 
    sq-a1 sq-a2 sq-a3 sq-a4 sq-a5 sq-b1 sq-b2 sq-b3 sq-b4 sq-b5 sq-c1 sq-c2 sq-c3 sq-c4 sq-c5 sq-d1 sq-d2 sq-d3 sq-d4 sq-d5 sq-e1 sq-e2 sq-e3 sq-e4 sq-e5 sq-f1 sq-f2 sq-f3 sq-f4 sq-f5 sq-g1 sq-g2 sq-g3 sq-g4 sq-g5 sq-h1 sq-h2 sq-h3 sq-h4 sq-h5 - square
)

(:init
    ; 5x5
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

    (is-free sq-a1)
    (is-free sq-a2)
    (is-free sq-a3)
    (is-free sq-a4)
    (is-free sq-a5)
    (is-free sq-b1)
    (is-free sq-c1)
    (is-free sq-d1)
    (is-free sq-e1)
    (is-free sq-e2)
    (is-free sq-e3)
    (is-free sq-e4)
    (is-free sq-e5)
    (is-free sq-b5)
    (is-free sq-c5)
    (is-free sq-d5)

    (is-wall sq-b2)
    (is-wall sq-b3)
    (is-wall sq-b4)
    (is-wall sq-c2)
    (is-wall sq-c4)
    (is-wall sq-d2)
    (is-wall sq-d3)
    (is-wall sq-d4)

    (box-at sq-d1)

    (coin-at sq-a1)

    (player-at sq-c3)
    (bomb-at sq-c3)
    (has-no-trampoline)

    (= (time) 0)
    (= (collected-coins) 0)
    (= (bombs-available) 0)
)

; testing preference 
; (:goal (and
;          (forall (?b - box) (collected-box ?b))
;          (preference pickUpCoin(> (collected-coins) 0))
;         )
; )


; (:metric minimize (is-violated pickUpCoin))

; OPTIC should support preferences but it apparently does not 
; (:constraints (and
;    (preference pick-coin1 (sometime (picked-up-coin sq-a1)))
; ))

(:goal (and
    (box-at sq-e1)
))

(:metric minimize (- (time) (* (collected-coins) 10)))
)