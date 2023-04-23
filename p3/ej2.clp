(deffunction par (?n)
    (if (or (not (integerp ?n)) (< ?n 0)) then
        (printout t "Num error: " ?n crlf)
    
    else
        (if (= ?n 1) then 2
        else (+ (par (- ?n 1)) 2)
        )
    )
)