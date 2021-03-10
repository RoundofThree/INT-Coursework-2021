(define (domain sokoban)
    ;Header and description

    ;remove requirements that are not needed
    (:requirements :strips :typing :conditional-effects :negative-preconditions :equality)

    (:types
        player square box
        ; slow-elevator fast-elevator - elevator
        ; passenger elevator count - object
        )

    (:predicates
        (player-at ?a - square)
        ;(box-at ?a - box ?b - square)
        (box-at ?a - square)
        ;(target-at ?a - square)
        (above ?a - square ?b - square)
        (below ?a - square ?b - square)
        (left-to ?a - square ?b - square)
        (right-to ?a - square ?b - square)
        (is-empty ?a - square)
    )

    (:action move-up
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (above ?dest ?current)
            (is-empty ?dest)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?dest)
        )
    )

    (:action move-down
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (below ?dest ?current)
            (is-empty ?dest)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?dest)
        )
    )

    (:action move-left
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (left-to ?dest ?current)
            (is-empty ?dest)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?dest)
        )
    )

    (:action move-right
        :parameters (?current - square ?dest - square)
        :precondition (and
            (player-at ?current)
            (right-to ?dest ?current)
            (is-empty ?dest)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?dest)
        )
    )

    (:action push-up
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (above ?boxbefore ?current)
            (above ?boxafter ?boxbefore)
            (box-at ?boxbefore)
            (is-empty ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
        )
    )

    (:action push-down
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (below ?boxbefore ?current)
            (below ?boxafter ?boxbefore)
            (box-at ?boxbefore)
            (is-empty ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
        )
    )

    (:action push-left
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (left-to ?boxbefore ?current)
            (left-to ?boxafter ?boxbefore)
            (box-at ?boxbefore)
            (is-empty ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
        )
    )

    (:action push-right
        :parameters (?current - square ?boxbefore - square ?boxafter - square)
        :precondition (and
            (player-at ?current)
            (right-to ?boxbefore ?current)
            (right-to ?boxafter ?boxbefore)
            (box-at ?boxbefore)
            (is-empty ?boxafter)
        )
        :effect (and
            (not (player-at ?current))
            (player-at ?boxbefore)
            (not (box-at ?boxbefore))
            (box-at ?boxafter)
        )
    )

)