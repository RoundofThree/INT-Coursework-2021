    (:axiom ; turn green
        :vars (?r - road)
        :context (and 
            (= (time-left ?r) 0.0)
            (not (green-light ?r))
        )
        :implies (and 
            (green-light ?r)
            (assign (time-left ?r) (green-time ?r))
        )
    )

    (:axiom ; turn red
        :vars (?r - road)
        :context (and 
            (= (time-left ?r) 0.0)
            (green-light ?r)
        )
        :implies (and 
            (not (green-light ?r))
            (assign (time-left ?r) (red-time ?r))
        )
    )