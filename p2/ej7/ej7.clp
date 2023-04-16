(deffacts datos
    (dato hola 3 7)
    (dato pa 9 5 ti 9)
    (dato 98 mi 987 76)
    (dato 78 cola)
)

(defrule quitarNumeros
    (dato $?a ?x&:(numberp ?x) $?b)
    =>
    (assert (dato $?a $?b))
)