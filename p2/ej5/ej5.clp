(deffacts datazos
    (datos 1 2)
    (datos hola 1 3 nuevo 1 adios)
    (datos 1 lol 2 5)
    (datos 1 8 5) 
)

(defrule eliminar-unos
    (datos $?a ?x&:(numberp ?x)&:(= ?x 1) $?b)
    =>
    (assert(datos $?a $?b))
)