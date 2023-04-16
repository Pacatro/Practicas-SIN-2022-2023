(deffacts datazos
    (datos 1 2)
    (datos 4 9)
    (datos 9 5)
    (datos 1 3)
    (datos 0 8) 
)

(defrule dato-valido
    (datos ?x ?y)
    (test (< ?x ?y))
    =>
    (printout t "Datos validos: " ?x ", " ?y crlf)
)