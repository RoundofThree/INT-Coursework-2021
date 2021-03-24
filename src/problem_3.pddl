; Best 25 steps 
; with tools
; please see problem1.pdf 

(define (problem problem_3)
    (:domain sokoban)
    (:objects
         sq-a1 sq-a2 sq-a3 sq-a4 sq-b1 sq-b2 sq-b3 sq-b4 sq-c1 sq-c2 sq-c3 sq-c4 sq-d1 sq-d2 sq-d3 sq-d4 - square 
         b1 - box
    )
    (:init 
        ; for better visualisation please see the pdf in attachment called "problem1.pdf"
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

        (is-free sq-a1)
        (is-free sq-a2)
        (is-free sq-a3)
        (is-free sq-a4)

        ; (is-free sq-b1)
        (is-free sq-b2)
        (is-free sq-b3)
        ; (is-free sq-b4)
        
        (is-free sq-c1)
        ; (is-free sq-c2)
        ; (is-free sq-c3)
        ; (is-free sq-c4)

        (is-free sq-d1)
        ; (is-free sq-d2)
        (is-free sq-d3)
        ; (is-free sq-d4)

        (is-wall sq-b1)
        (is-wall sq-c2)
        (is-wall sq-d2)
        (is-wall sq-c3)
        (is-wall sq-b4)
        (is-wall sq-d4)

        (bomb-at sq-a3)
        (bomb-at sq-b3)
        
        (hole-at sq-a2)
        (no-hole-at sq-a1)
        (no-hole-at sq-a3)
        (no-hole-at sq-a4)
        (no-hole-at sq-b1)
        (no-hole-at sq-b2)
        (no-hole-at sq-b3)
        (no-hole-at sq-b4)
        (no-hole-at sq-c1)
        (no-hole-at sq-c2)
        (no-hole-at sq-c3)
        (no-hole-at sq-c4)
        (no-hole-at sq-d1)
        (no-hole-at sq-d2)
        (no-hole-at sq-d3)
        (no-hole-at sq-d4)
         
        (box-at b1 sq-c4)

        (coin-at sq-b2)
        
        (player-at p1 sq-d1)
        (has-no-trampoline)

        (trampoline-at sq-c1)
        (= (total-cost) 0)
        (= (pliers-available p1) 10)
        (= (bombs-available p1) 0)
        (= (collected-coins) 0)
    )

    (:goal (and 
       (forall (?b - box) (collected-box ?b))
        ; (> (collected-coins) 0)
        (preference  (> (collected-coins) 0))
     )
    )

    (:metric minimize (-(total-cost)
                        (collected-coins)
    ))
)