(define (domain sokoban)

   (:requirements :strips :typing :conditional-effects :fluents :preferences :constraints :universal-preconditions)

    ; functionalities to add:
    ; 1- Bomb to destroy wall (details?) - take time to destroy with durative actions (DONE)
    ; 2- Jump through wall (DONE) - player can only jump if it has trampoline (it can have max one trampoline in a game)
    ; 3- Transport door (should transfer boxes or player?) - NOT NECCESSARY TO IMPLEMENT (adds to randomness)
    ; 4- Push and pull - in order to push and poor a player needs to have pliers (number of pliers is predefined in problem file )
    ; 5- Maximize reward (coins) or minimize number of moves (OPTIC DOES NOT SUPPORT METRIC apparently) - after testing this features was abondoned


    ; 1- Change to add objects player, box (DONE)
    ; 2- Represent holes and collected state (DONE)
    ; 2- Represent walls (ALREADY DONE)
    ; 3- Pick up bomb (has-bomb ?s - square) (DONE)
    ; 4- Break a wall (I have to identify first that it is a wall) (DONE)

    (:types
        player box square
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
        (coin-at ?a - square)
        (above ?a - square ?b - square)  ; a is above b 
        (left-to ?a - square ?b - square); a is left to b
        (is-free ?a - square) ; no player no box no wall
        (is-wall ?a - square) 
        (collected-box ?box - box)  ; can collected boxes be moved? YES, they must turn into non collected box if moved away from hole 
        (trampoline-at ?a -square)
        (has-trampoline)
        (has-no-trampoline) 
    )

    (:functions
        (time)
        (collected-coins)
        (bombs-available ?p - player) 
        (pliers-available ?p - player)
    )

    ; PICK UP COIN

    (:action pick-up-coin
        :parameters (?current - square ?p - player)
        :precondition (and 
            (player-at ?p ?current)
            (coin-at ?current)
        )
        :effect (and 
            (not (coin-at ?current))
            (increase (collected-coins) 1)
        )
    )

    ; MOVE
    
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

    ; JUMP

    (:action pick-up-trampoline
        :parameters (?current - square ?p - player)
        :precondition (and 
            (player-at ?p ?current)
            (trampoline-at ?current)
            (has-no-trampoline) ; can only pick up a trampoline if the player does not have one yet
        )
        :effect (and 
            (not (trampoline-at ?current))
            (has-trampoline)
            (not (has-no-trampoline))
            (increase (time) 1)
        )
    ) 

    (:action jump-left
        :parameters (?p - player ?current - square ?squareLeft - square ?dest - square)
        :precondition (and 
            (player-at ?p ?current)
            (left-to ?dest ?squareLeft)
            (left-to ?squareLeft ?current)
            (is-free ?dest)
            (is-wall ?squareLeft)  
            (has-trampoline)   
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (not (is-free ?dest))
            (player-at ?p ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    (:action jump-right
        :parameters (?p - player ?current - square ?squareRight - square ?dest - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?current ?squareRight)
            (left-to ?squareRight ?dest)
            (is-free ?dest)
            (is-wall ?squareRight)
            (has-trampoline)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (not (is-free ?dest))
            (player-at ?p ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    (:action jump-up
        :parameters (?p - player ?current - square ?squareAbove - square ?dest - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?dest ?squareAbove)
            (left-to ?squareAbove ?current)
            (is-free ?dest)
            (is-wall ?squareAbove)
            (has-trampoline)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (not (is-free ?dest))
            (player-at ?p ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    (:action jump-down
        :parameters (?p - player ?current - square ?squareBelow - square ?dest - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?current ?squareBelow)
            (left-to ?squareBelow ?dest)
            (is-free ?dest)
            (is-wall ?squareBelow)
            (has-trampoline)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?p ?current))
            (not (is-free ?dest))
            (player-at ?p ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    ; BOMB 
    
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

    ; PUSH BOXES 
    
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
            ; (when (no-hole-at ?boxafter) (not (collected-box ?box))) ; not supported by OPTIC, causes segfault
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
        )
    )

    ; PULL BOXES 

    (:action pull-left
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?current ?boxbefore)
            (left-to ?positionafter ?current)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (no-hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (not (collected-box ?box))
        )
    )


     (:action pull-right
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?boxbefore ?current)
            (left-to ?current ?positionafter)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (no-hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (not (collected-box ?box))
        )
    )

    (:action pull-up
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?current ?boxbefore)
            (above ?positionafter ?current)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (no-hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (not (collected-box ?box))
        )
    )

    (:action pull-down
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?boxbefore ?current)
            (above ?current ?positionafter)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (no-hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (not (collected-box ?box))
        )
    )

    (:action pull-left-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?current ?boxbefore)
            (left-to ?positionafter ?current)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (not (collected-box ?box))
            (collected-box ?box)
        )
    )


     (:action pull-right-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (left-to ?boxbefore ?current)
            (left-to ?current ?positionafter)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (collected-box ?box) 
        )
    )

    (:action pull-up-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?current ?boxbefore)
            (above ?positionafter ?current)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (collected-box ?box) 
        )
    )

    (:action pull-down-to-hole
        :parameters (?current - square ?p - player ?box - box ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?p ?current)
            (above ?boxbefore ?current)
            (above ?current ?positionafter)
            (box-at ?box ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available ?p) 0)
            (hole-at ?current)
        )
        :effect (and
            (not (player-at ?p ?current))
            (is-free ?boxbefore)
            (player-at ?p ?positionafter)
            (not (box-at ?box ?boxbefore))
            (box-at ?box ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available ?p) 1)
            (increase (time) 1)
            (collected-box ?box)
        )
    )
    
)