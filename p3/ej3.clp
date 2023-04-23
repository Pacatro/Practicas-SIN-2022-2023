(deffunction impar (?n)
    (if(or (not (integerp ?n)) (< ?n 0)) then
        (printout t "Impar error: " ?n crlf)
    else
        (if (= ?n 1) then 1
        else (+ (impar (- ?n 1)) 2)
        )
    )
)