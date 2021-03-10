(define (domain superspreader-planning)
  (:requirements :strips :typing :durative-actions :action-costs :numeric-fluents :conditional-effects  :time)

  (:types
    walk bicycle car - transportation ;ways to go to other locations
    spreader
    group ;group of people at the location
    transportation
    location
  )

  (:predicates
    (spreader-at ?s - spreader ?l1 - location)
    (group-at ?g - group ?l1 - location)
    (accessible ?t - transportation ?l1 ?l2 - location)
    (infected ?g - group) ;is the group infected
    (died ?s - spreader) ;is the spreader died due to its energy-level = 0
  )

  (:functions
    (energy-level ?s - spreader) ;energy-level of the spreader
    (energy-required ?t - transportation ?l1 ?l2 - location) ;energy required to go from l1 to l2
    (energy-to-infect ?g - group) ;energy required to infect the group
    (energy-released ?g - group) ;energy relased from the group back to the spreader
    (infect-time-required ?g - group) ;time required to infect the group
    (walk-time-required ?w - walk ?l1 ?l2 - location) ;time required to walk from l1 to l2
    (bicycle-time-required ?b - bicycle ?l1 ?l2 - location) ;time required to cycle from l1 to l2
    (car-time-required ?c - car ?l1 ?l2 - location) ;time required to drive from l1 to l2
    (total-time) ;goal: minimise the total-time
  )

  (:durative-action walk
    :parameters (?s - spreader ?w - walk ?from ?to - location)
    :duration (= ?duration (walk-time-required ?w ?from ?to))
    :condition (and
      (at start (not (died ?s)))
      (at start (spreader-at ?s ?from))
      (at start (accessible ?w ?from ?to))
      (at start (>= (energy-level ?s) (energy-required ?w ?from ?to)))
    )
    :effect (and
      (at start (not (spreader-at ?s ?from)))
      (at end (spreader-at ?s ?to))
      (at end (decrease (energy-level ?s) (energy-required ?w ?from ?to)))
      (at end (increase (total-time) (walk-time-required ?w ?from ?to)))
    )
  )

  (:durative-action cycle
    :parameters (?s - spreader ?b - bicycle ?from ?to - location)
    :duration (= ?duration (bicycle-time-required ?b ?from ?to))
    :condition (and
      (at start (not (died ?s)))
      (at start (spreader-at ?s ?from))
      (at start (accessible ?b ?from ?to))
      (at start (>= (energy-level ?s) (energy-required ?b ?from ?to)))
    )
    :effect (and
      (at start (not (spreader-at ?s ?from)))
      (at end (spreader-at ?s ?to))
      (at end (decrease (energy-level ?s) (energy-required ?b ?from ?to)))
      (at end (increase (total-time) (bicycle-time-required ?b ?from ?to)))
    )
  )

  (:durative-action drive
    :parameters (?s - spreader ?c - car ?from ?to - location)
    :duration (= ?duration (car-time-required ?c ?from ?to))
    :condition (and
      (at start (not (died ?s)))
      (at start (spreader-at ?s ?from))
      (at start (accessible ?c ?from ?to))
      (at start (>= (energy-level ?s) (energy-required ?c ?from ?to)))
    )
    :effect (and
      (at start (not (spreader-at ?s ?from)))
      (at end (spreader-at ?s ?to))
      (at end (decrease (energy-level ?s) (energy-required ?c ?from ?to)))
      (at end (increase (total-time) (car-time-required ?c ?from ?to)))
    )
  )

  ; (:action move
  ;   :parameters (?s - spreader ?t - transportation ?from ?to - location)
  ;   :precondition (and 
  ;     (spreader-at ?s ?from) 
  ;     (accessible ?t ?from ?to)
  ;     (>= (energy-level ?s) (energy-required ?t ?from ?to))
  ;   )
  ;   :effect (and
  ;     (not (spreader-at ?s ?from))
  ;     (spreader-at ?s ?to)
  ;     (decrease (energy-level ?s) (energy-required ?t ?from ?to))
  ;   )
  ; )

  (:durative-action infect
    :parameters (?s - spreader ?destination - location ?g - group)
    :duration (= ?duration (infect-time-required ?g))
    :condition (and
      (at start (not (died ?s)))
      (at start (spreader-at ?s ?destination))
      (at start (group-at ?g ?destination))
      (at start (not (infected ?g)))
      (at start (>= (energy-level ?s) (energy-to-infect ?g)))
    )
    :effect (and
      (at end (infected ?g))
      (at end (decrease (energy-level ?s) (energy-to-infect ?g)))
      (at end (increase (energy-level ?s) (energy-released ?g)))
      (at end (increase (total-time) (infect-time-required ?g)))
    )
  )

  (:action die
    :parameters (?s - spreader)
    :precondition (and
      (not (died ?s))
      (>= (energy-level ?s) 0)
    )
    :effect (
      (died ?s)
    )
  )
)