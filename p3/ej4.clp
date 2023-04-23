(deffunction suma-pares (?n)
    (if (= ?n 1) then 2
    else (+ (* 2 ?n) (suma-pares (- ?n 1)))
    )
)

(suma_pares 5)