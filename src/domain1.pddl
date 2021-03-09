; Autonomous Wheelchair planning - 2D grid which represent room/word with obstacles within
; obstacles can be placed anywhere within in the word and can take any space (number of square)
; Aim - wheel chair should take us to door- goal within shortest time
; planning in deterministic discrete and non temporal word

define((domain autonomous-wheelchair)
    (:requirements :typing :equality :negative-preconditions :action-costs)
      (:types position obstacles - object
              table, chair, bed - obstacles
      )
      (:functions
        distance ?pos1 ?pos2 - position
      )
    (:predicates
        (at ?x-position ?y -position)
        (clear ?xy-position)
    )
    (:action move_one
        :parameters(?intial- position ?final-position)
        :precondition(and
                     (clear ?final)
                     (at ?initial)
        )
        :effect((clear ?initial)
                 (at ?final)
                 (increase (total-cost)1)
        )
    )

)
