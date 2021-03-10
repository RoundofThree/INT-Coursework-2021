(define (problem easy_3) (:domain farm-supply-chain)
(:objects 
    c1 - client 
    t1 - truck 
    f1 - farm 
    fr - fruit 
    i1 - intersection
)

(:init
    (truck-at t1 i1)
    (client-at c1 i1)
    (farm-at f1 i1)
    (production-type f1 fr)
    (= (farm-quantity f1) 10)
    (= (production-rate f1) 1.0)
    (truck-holds t1 fr)
    (= (truck-weight t1) 10)
    (demand-type c1 fr)
    (= (demand-quantity c1 fr) 10)
    (= (initial-reward c1) 10000)
    (= (reward-slope c1) 0)

    (can-start-time)
    (= (current-time) 0.0)
    (= (total-reward) 0.0) 
)

(:goal (and
    (client-satisfied c1)
))

;un-comment the following line if metric is needed
(:metric maximize (total-reward))
)
