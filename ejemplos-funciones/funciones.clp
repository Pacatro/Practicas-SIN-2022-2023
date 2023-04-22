(deffunction factorial(?a)
    (if(or (not (integerp ?a)) (< ?a 0)) then
        (printout t "Factorial error: " ?a crlf)
    else
        (if (= ?a 0) then 1
        else (* ?a (factorial (- ?a 1)))
        )
    )
)

(defmethod + ((?a STRING) (?b STRING))
    (str-cat ?a ?b)
)

(defmethod + ((?a STRING) (?b NUMBER))
    (printout t "NO" crlf)
)

(defmethod + ((?a SYMBOL) (?b SYMBOL))
    (sym-cat ?a ?b)
)