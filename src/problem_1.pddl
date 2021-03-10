(define (problem easy) (:domain farm-supply-chain)

    (:objects
        c1 - client 
        t1 - truck 
        f1 - farm 
        r1 r2 r3 r4 - road ; I am thinking of a complete graph 
        i1 i2 i3 - intersection 
        blackberry - fruit ; fruit types
    )
    (:init
        (truck-at t1 i1) ; positions 
        (client-at c1 i2)
        (farm-at f1 i3)
        ; intersections and roads
        (road-begin r1 i1)
        (road-end r1 i2)
        (road-begin r3 i2)
        (road-end r3 i1)
        (= (cross-time r3) 1)
        (= (cross-time r1) 1)
        (road-begin r2 i2)
        (road-end r2 i3)
        (road-begin r4 i3)
        (road-end r4 i2)
        (= (cross-time r2) 1)
        (= (cross-time r4) 1)
        ; farm production attributes
        (production-type f1 blackberry)  ; ONLY specify a single production type 
        (= (farm-quantity f1) 0.0)
        (= (production-rate f1) 5.0)
        ; truck specs
        (= (truck-weight t1) 0.0)
        (truck-not-holds t1 blackberry)
        ; client demand 
        (demand-type c1 blackberry)
        (= (demand-quantity c1 blackberry) 1)
        (= (reward-slope c1) 0.1)
        (= (initial-reward c1) -10)
        ; semaphores at intersections 
        (green-light r4)
        (green-light r1)
        (green-light r2)
        (green-light r3)
        (= (green-time r1) 2.0)
        (= (green-time r2) 2.0)
        (= (green-time r3) 2.0)
        (= (green-time r4) 2.0)
        
        (= (red-time r1) 2.0)
        (= (red-time r2) 2.0)
        (= (red-time r3) 2.0)
        (= (red-time r4) 2.0)

        (= (time-left r1) 2.0)
        (= (time-left r2) 2.0)
        (= (time-left r3) 2.0)
        (= (time-left r4) 2.0)

        (can-start-time)
        (= (current-time) 0.0)
        (= (total-reward) 0.0)        
    )

    (:goal (and
        (client-satisfied c1)
    ))

    (:metric minimize (total-reward))
)
