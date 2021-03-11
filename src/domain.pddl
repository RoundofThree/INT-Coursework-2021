(define (domain sokoban)
    ;Header and description

    ;remove requirements that are not needed
    (:requirements :strips :typing :conditional-effects :numeric-fluents :action-costs :durative-actions)

    ; functionalities to add:
    ; 1- Bomb to destroy wall (details?) - take time to destroy with durative actions 
    ; 2- Jump through wall?
    ; 3- Transport door (should transfer boxes or player?)
    ; 4- Push and pull
    ; 5- Maximize reward (coins) or minimize number of moves


    ; 1- Change to add objects player, box (DONE)
    ; 2- Represent holes and collected state (DONE)
    ; 2- Represent walls (ALREADY DONE)
    ; 3- Pick up bomb (has-bomb ?s - square) (DONE)
    ; 4- Break a wall (I have to identify first that it is a wall) 

    (:types
        player box 
        square
    )
    
    (:constants
        p1 - player ; ONLY one player 
    )

    (:predicates
        (player-at ?p - player ?a - square)
        (box-at ?b - box ?a - square)
        (hole-at ?a - square)
        (no-hole-at ?a - square)
        (bomb-at ?a - square) ; to be picked up  
        (above ?a - square ?b - square)  ; a is above b 
        ; (below ?a - square ?b - square) redundant
        (left-to ?a - square ?b - square); a is left to b
        ; (right-to ?a - square ?b - square) redundant
        (is-free ?a - square) ; no player no box no wall
        (is-wall ?a - square) 
        (collected-box ?box - box)  ; can collected boxes be moved? YES, must turn into non collected box 
    )

    (:functions
        (time)
        (bombs-available ?p - player) 
    )

    (:action move-up
        :parameters (?p - player ?current - square ?dest - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?dest ?current)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (not (is-free ?dest))
            (player-at ?p ?dest)
            (increase (time) 1)
        )
    )

    (:action move-down
        :parameters (?p - player ?current - square ?dest - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?current ?dest)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (not (is-free ?dest))
            (player-at ?p ?dest)
            (increase (time) 1)
        )
    )

    (:action move-left
        :parameters (?p - player ?current - square ?dest - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?dest ?current)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (not (is-free ?dest))
            (player-at ?p ?dest)
            (increase (time) 1)
        )
    )

    (:action move-right
        :parameters (?p - player ?current - square ?dest - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?current ?dest)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (player-at ?p ?dest)
            (not (is-free ?dest))
            (increase (time) 1)
        )
    )

    (:action pick-up-bomb
        :parameters (?current - square ?p - player)
        :precondition (and 
            (player-at ?p ?current)
            (bomb-at ?current)
        )
        :effect (and 
            (not (bomb-at ?current))
            (increase (bombs-available ?p) 1)
        )
    ) 

    (:action break-north-wall
        :parameters (?current - square ?p - player ?target - square)
        :precondition (and 
            (above ?target ?current)
            (player-at ?p ?current)
            (is-wall ?target)
            (> (bombs-available ?p) 0)
        )
        :effect (and 
            (decrease (bombs-available ?p) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )

    (:action break-south-wall
        :parameters (?current - square ?p - player ?target - square)
        :precondition (and 
            (above ?current ?target)
            (player-at ?p ?current)
            (is-wall ?target)
            (> (bombs-available ?p) 0)
        )
        :effect (and 
            (decrease (bombs-available ?p) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )

    (:action break-west-wall
        :parameters (?current - square ?p - player ?target - square)
        :precondition (and 
            (left-to ?target ?current)
            (player-at ?p ?current)
            (is-wall ?target)
            (> (bombs-available ?p) 0)
        )
        :effect (and 
            (decrease (bombs-available ?p) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )

    (:action break-east-wall
        :parameters (?current - square ?p - player ?target - square)
        :precondition (and 
            (left-to ?current ?target)
            (player-at ?p ?current)
            (is-wall ?target)
            (> (bombs-available ?p) 0)
        )
        :effect (and 
            (decrease (bombs-available ?p) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )
    
    (:action push-up
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?boxbefore ?current)
            (above ?boxafter ?boxbefore)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (no-hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (not (collected-box ?box))  ; may already be not collected
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) ; uses negative preconditions 
        )
    )

    (:action push-up-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?boxbefore ?current)
            (above ?boxafter ?boxbefore)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (collected-box ?box)
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) ; uses negative preconditions 
        )
    )
    
    (:action push-down
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?current ?boxbefore)
            (above ?boxbefore ?boxafter)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (no-hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (not (collected-box ?box))
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) 
        )
    )

    (:action push-down-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?current ?boxbefore)
            (above ?boxbefore ?boxafter)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (collected-box ?box)
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) 
        )
    )
    

    (:action push-left
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?boxbefore ?current)
            (left-to ?boxafter ?boxbefore)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (no-hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (not (collected-box ?box))
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) 
        )
    )

    (:action push-left-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?boxbefore ?current)
            (left-to ?boxafter ?boxbefore)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (collected-box ?box)
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) 
        )
    )
    
    (:action push-right
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?current ?boxbefore)
            (left-to ?boxbefore ?boxafter)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (no-hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (not (collected-box ?box))
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) 
        )
    )

    (:action push-right-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?current ?boxbefore)
            (left-to ?boxbefore ?boxafter)
            (box-at ?box ?boxbefore)
            (is-free ?boxafter)
            (hole-at ?boxafter)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?current)
            (player-at ?p ?boxbefore)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
            (collected-box ?box)
            ; (when (hole-at ?boxafter) (collected-box ?box))
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) 
        )
    )
    
)