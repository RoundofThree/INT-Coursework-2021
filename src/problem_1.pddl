(define (problem easy) (:domain farm-supply-chain)

    (:objects
        c1 - client 
        t1 - truck 
        f1 - farm 
        r1 - road ; I am thinking of a complete graph 
        i1 i2 - intersection 
        blackberry - fruit ; fruit types
    )
    (:init
        (truck-at t1 i1) ; positions 
        (client-at c1 i2)
        (farm-at f1 i1)
        ; intersections and roads
        (road-begin r1 i1)
        (road-end r1 i2)
        (= (cross-time r1) 1)
        ; farm production attributes
        (production-type f1 blackberry)  ; ONLY specify a single production type 
        (= (farm-quantity f1) 10)
        (= (production-rate f1) 50)
        ; truck specs
        (= (truck-weight t1) 0.0)
        (truck-not-holds t1 blackberry)
        ; client demand 
        (demand-type c1 blackberry)
        (= (demand-quantity c1 blackberry) 3)
        (= (reward-slope c1) 0.1)
        (= (initial-reward c1) -10)
        ; semaphores at intersections 
        (green-light r1)
        (= (green-time r1) 10000)      
        (= (red-time r1) 1)

        (= (time-left r1) 100000.0)
        ; (client-satisfied c1)  ; gu yi de 
        (can-start-time)
        (= (current-time) 0)
        (= (total-reward) 0)        
    )

    (:goal (and
        (client-satisfied c1)
    ))

    (:metric minimize (total-reward))
)
