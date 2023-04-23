(deffunction n_t(?n)
    (if (or (not (integerp ?n)) (< ?n 0)) then
        (printout t "ERROR" crlf)
    else
        (if (= ?n 1) then 1
        else (+ ?n (n_t (- ?n 1)))
        )
    )
)