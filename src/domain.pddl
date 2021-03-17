(define (domain sokoban)

    ;remove requirements that are not needed
   (:requirements :strips :typing :conditional-effects :fluents :preferences :constraints :universal-preconditions)

    ; Functionalities added:
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
        square
    )

    (:predicates
        (player-at ?a - square)
        (box-at ?a - square)
        (bomb-at ?a - square) ; to be picked up  
        (coin-at ?a - square)
        (above ?a - square ?b - square)  ; a is above b 
        (left-to ?a - square ?b - square); a is left to b
        (is-free ?a - square) ; no player no box no wall
        (is-wall ?a - square) 
        (trampoline-at ?a -square)
        (has-trampoline)
        (has-no-trampoline) 
    )
    
    ; a player is at most on one square at a time
    (:constraints 
         (forall (?s - square)
                 (at-most-once (player-at ?s))  ; ???????????? wrong statement
         )
    )

    (:functions
        (time)
        (collected-coins)
        (bombs-available) 
        (pliers-available)
    )

    ; PICK UP COIN

    (:action pick-up-coin
        :parameters (?current - square)
        :precondition (and 
            (player-at ?current)
            (coin-at ?current)
        )
        :effect (and 
            (not (coin-at ?current))
            (increase (collected-coins) 1)
        )
    )

    ; MOVE
    
    (:action move-up
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (above ?dest ?current)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (not (is-free ?dest))
            (player-at ?dest)
            (increase (time) 1)
        )
    )

    (:action move-down
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (above ?current ?dest)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (not (is-free ?dest))
            (player-at ?dest)
            (increase (time) 1)
        )
    )

    (:action move-left
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (left-to ?dest ?current)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (not (is-free ?dest))
            (player-at ?dest)
            (increase (time) 1)
        )
    )

    (:action move-right
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (left-to ?current ?dest)
            (is-free ?dest)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (player-at ?dest)
            (not (is-free ?dest))
            (increase (time) 1)
        )
    )

    ; JUMP

    (:action pick-up-trampoline
        :parameters (?current - square)
        :precondition (and 
            (player-at ?current)
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
        :parameters (?current - square ?squareLeft - square ?dest - square)
        :precondition (and 
            (player-at ?current)
            (left-to ?dest ?squareLeft)
            (left-to ?squareLeft ?current)
            (is-free ?dest)
            (is-wall ?squareLeft)  
            (has-trampoline)   
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (not (is-free ?dest))
            (player-at ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    (:action jump-right
        :parameters (?current - square ?squareRight - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (left-to ?current ?squareRight)
            (left-to ?squareRight ?dest)
            (is-free ?dest)
            (is-wall ?squareRight)
            (has-trampoline)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (not (is-free ?dest))
            (player-at ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    (:action jump-up
        :parameters (?current - square ?squareAbove - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (above ?dest ?squareAbove)
            (left-to ?squareAbove ?current)
            (is-free ?dest)
            (is-wall ?squareAbove)
            (has-trampoline)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (not (is-free ?dest))
            (player-at ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    (:action jump-down
        :parameters (?current - square ?squareBelow - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (above ?current ?squareBelow)
            (left-to ?squareBelow ?dest)
            (is-free ?dest)
            (is-wall ?squareBelow)
            (has-trampoline)
        )
        :effect (and
            (is-free ?current)
            (not (player-at ?current))
            (not (is-free ?dest))
            (player-at ?dest)
            (not (has-trampoline))
            (has-no-trampoline)
            (increase (time) 1)
        )
    )

    ; BOMB 
    
    (:action pick-up-bomb
        :parameters (?current - square)
        :precondition (and 
            (player-at ?current)
            (bomb-at ?current)
        )
        :effect (and 
            (not (bomb-at ?current))
            (increase (bombs-available) 1)
        )
    )

    (:action break-north-wall
        :parameters (?current - square ?target - square)
        :precondition (and 
            (above ?target ?current)
            (player-at ?current)
            (is-wall ?target)
            (> (bombs-available) 0)
        )
        :effect (and 
            (decrease (bombs-available) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )

    (:action break-south-wall
        :parameters (?current - square ?target - square)
        :precondition (and 
            (above ?current ?target)
            (player-at ?current)
            (is-wall ?target)
            (> (bombs-available) 0)
        )
        :effect (and 
            (decrease (bombs-available) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )

    (:action break-west-wall
        :parameters (?current - square ?target - square)
        :precondition (and 
            (left-to ?target ?current)
            (player-at ?current)
            (is-wall ?target)
            (> (bombs-available) 0)
        )
        :effect (and 
            (decrease (bombs-available) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )

    (:action break-east-wall
        :parameters (?current - square ?target - square)
        :precondition (and 
            (left-to ?current ?target)
            (player-at ?current)
            (is-wall ?target)
            (> (bombs-available) 0)
        )
        :effect (and 
            (decrease (bombs-available) 1)
            (not (is-wall ?target))
            (is-free ?target)
            (increase (time) 1)
        )
    )

    ; PUSH BOXES 
    
    (:action push-up
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (above ?boxbefore ?current)
            (above ?boxafter ?boxbefore)
            (box-at ?boxbefore)
            (is-free ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?current)
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
        )
    )
    
    (:action push-down
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (above ?current ?boxbefore)
            (above ?boxbefore ?boxafter)
            (box-at ?boxbefore)
            (is-free ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?current)
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
        )
    )

    (:action push-left
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (left-to ?boxbefore ?current)
            (left-to ?boxafter ?boxbefore)
            (box-at ?boxbefore)
            (is-free ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?current)
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
        )
    )
    
    (:action push-right
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (left-to ?current ?boxbefore)
            (left-to ?boxbefore ?boxafter)
            (box-at ?boxbefore)
            (is-free ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?current)
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
            (not (is-free ?boxafter))
            (increase (time) 1)
        )
    )

    ; PULL BOXES 

    (:action pull-left
        :parameters (?current - square ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?current)
            (left-to ?current ?boxbefore)
            (left-to ?positionafter ?current)
            (box-at ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available) 0)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?boxbefore)
            (player-at ?positionafter)
            (not (box-at ?boxbefore))
            (box-at ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available) 1)
            (increase (time) 1)
        )
    )


     (:action pull-right
        :parameters (?current - square ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?current)
            (left-to ?boxbefore ?current)
            (left-to ?current ?positionafter)
            (box-at ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available) 0)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?boxbefore)
            (player-at ?positionafter)
            (not (box-at ?boxbefore))
            (box-at ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available) 1)
            (increase (time) 1)
        )
    )

    (:action pull-up
        :parameters (?current - square ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?current)
            (above ?current ?boxbefore)
            (above ?positionafter ?current)
            (box-at ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available) 0)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?boxbefore)
            (player-at ?positionafter)
            (not (box-at ?boxbefore))
            (box-at ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available) 1)
            (increase (time) 1)
        )
    )

    (:action pull-down
        :parameters (?current - square ?boxbefore - square ?positionafter - square)
        :precondition (and
            (player-at ?current)
            (above ?boxbefore ?current)
            (above ?current ?positionafter)
            (box-at ?boxbefore)
            (is-free ?positionafter)
            (> (pliers-available) 0)
        )
        :effect (and
            (not (player-at ?current))
            (is-free ?boxbefore)
            (player-at ?positionafter)
            (not (box-at ?boxbefore))
            (box-at ?current)
            (not (is-free ?positionafter))
            (decrease (pliers-available) 1)
            (increase (time) 1)
        )
    )
    
)