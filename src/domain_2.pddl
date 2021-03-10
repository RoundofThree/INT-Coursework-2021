(define (domain elevators-time)
(:requirements :typing :durative-actions :action-costs :numeric-fluents :conditional-effects  :time)
 (:types
 slow-elevator fast-elevator - elevator
passenger elevator count - object
 )
(:constants
p7 p6 p5 p4 p3 p2 p1 p0 p10 p9 p8 p13 p12 p11  - passenger
n1 n10 n0 n12 n11 n5 n4 n3 n2 n9 n8 n7 n6 n13 n14 n15 n16  - count
slow0-0 slow1-0  - slow-elevator
fast1 fast0  - fast-elevator
)
 
(:predicates
 (passenger-at ?a - passenger ?b - count)
 (boarded ?a - passenger ?b - elevator)
 (lift-at ?a - elevator ?b - count)
 (reachable-floor ?a - elevator ?b - count)
 (above ?a - count ?b - count)
 (passengers ?a - elevator ?b - count)
 (can-hold ?a - elevator ?b - count)
 (next ?a - count ?b - count)
 (can-start-rewards)
 (goal-passenger-at ?a - passenger ?b - count)
 (collected-goal-passenger-at ?a - passenger ?b - count)
 )

 (:functions
 (travel-slow ?a - count ?b - count)
 (travel-fast ?a - count ?b - count)
 (currentTS)
 (total-cost)
 (reward-goal-passenger-at ?a - passenger ?b - count)
 (slopetime-goal-passenger-at ?a - passenger ?b - count)
 (flattime-goal-passenger-at ?a - passenger ?b - count)
 )

(:process reward-ticker
:parameters ()
:precondition  (can-start-rewards) 
:effect (increase (currentTS) (* #t 1.0) )
)

(:durative-action move-up-slow
:parameters (?lift - slow-elevator ?f1 - count ?f2 - count)
:duration (= ?duration (travel-slow ?f1 ?f2))
:condition (and 
(at start (above ?f1 ?f2))
(at start (reachable-floor ?lift ?f2))
(at start (lift-at ?lift ?f1))
)
:effect (and
(at start (not (lift-at ?lift ?f1)))
(at end (lift-at ?lift ?f2))
)
)

(:durative-action move-down-slow
:parameters (?lift - slow-elevator ?f1 - count ?f2 - count)
:duration (= ?duration (travel-slow ?f2 ?f1))
:condition (and 
(at start (above ?f2 ?f1))
(at start (reachable-floor ?lift ?f2))
(at start (lift-at ?lift ?f1))
)
:effect (and
(at start (not (lift-at ?lift ?f1)))
(at end (lift-at ?lift ?f2))
)
)

(:durative-action move-up-fast
:parameters (?lift - fast-elevator ?f1 - count ?f2 - count)
:duration (= ?duration (travel-fast ?f1 ?f2))
:condition (and 
(at start (above ?f1 ?f2))
(at start (reachable-floor ?lift ?f2))
(at start (lift-at ?lift ?f1))
)
:effect (and
(at start (not (lift-at ?lift ?f1)))
(at end (lift-at ?lift ?f2))
)
)

(:durative-action move-down-fast
:parameters (?lift - fast-elevator ?f1 - count ?f2 - count)
:duration (= ?duration (travel-fast ?f2 ?f1))
:condition (and 
(at start (above ?f2 ?f1))
(at start (reachable-floor ?lift ?f2))
(at start (lift-at ?lift ?f1))
)
:effect (and
(at start (not (lift-at ?lift ?f1)))
(at end (lift-at ?lift ?f2))
)
)
; --- Board
(:durative-action board
:parameters (?p - passenger ?lift - elevator ?f - count ?n1 - count ?n2 - count)
:duration (= ?duration 1.0)
:condition (and 
(at start (passengers ?lift ?n1))
(at start (next ?n1 ?n2))
(at start (passenger-at ?p ?f))
(at start (can-hold ?lift ?n2))
(over all (lift-at ?lift ?f))
)
:effect (and
(at start (not (passengers ?lift ?n1)))
(at start (not (passenger-at ?p ?f)))
(at end (passengers ?lift ?n2))
(at end (boarded ?p ?lift))
)
)
; --
(:durative-action leave
:parameters (?p - passenger ?lift - elevator ?f - count ?n1 - count ?n2 - count)
:duration (= ?duration 1.0)
:condition (and 
(at start (passengers ?lift ?n1))
(at start (boarded ?p ?lift))
(at start (next ?n2 ?n1))
(over all (lift-at ?lift ?f))
)
:effect (and
(at start (not (passengers ?lift ?n1)))
(at start (not (boarded ?p ?lift)))
(at end (passengers ?lift ?n2))
(at end (passenger-at ?p ?f))
)
)
; 
(:action collect-goal-passenger-at
:parameters (?passenger0 - passenger ?count1 - count)
:precondition (and 
(goal-passenger-at ?passenger0 ?count1)
(passenger-at ?passenger0 ?count1)
)
:effect (and
(not (passenger-at ?passenger0 ?count1))
(collected-goal-passenger-at ?passenger0 ?count1)
(when (> (currentTS) (flattime-goal-passenger-at ?passenger0 ?count1))
  (increase (total-cost) (reward-goal-passenger-at ?passenger0 ?count1)))
(when (and (> (currentTS) (slopetime-goal-passenger-at ?passenger0 ?count1)) (<= (currentTS) (flattime-goal-passenger-at ?passenger0 ?count1)))
  (increase (total-cost) (* (reward-goal-passenger-at ?passenger0 ?count1) (/ (- (currentTS) (slopetime-goal-passenger-at ?passenger0 ?count1)) (- (flattime-goal-passenger-at ?passenger0 ?count1) (slopetime-goal-passenger-at ?passenger0 ?count1))) ) ))
)
))
