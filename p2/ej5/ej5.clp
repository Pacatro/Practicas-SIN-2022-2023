(deffacts datazos
    (datos 1 2)
    (datos hola 1 3 nuevo 1 adios)
    (datos 1 lol 2 5)
    (datos 0 8 5) 
)

(defrule eliminar-unos
    (datos $?a ?x $?b)
    =>
    (printout t "Datos: " $?a crlf)
)