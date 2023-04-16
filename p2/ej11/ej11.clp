(deffacts datos
    (dato 1)
    (dato 5)
    (dato 8)
    (dato verde)
    (dato hola)
    (dato 9)
)

(defrule crear-dato-conjunto
    (not (todos-los-datos $?))
    =>
    (assert (todos-los-datos))
)

(defrule todosLosDatos
    ?h <- (dato ?x)
    ?t <- (todos-los-datos $?a)
    ?d <- (dato ?y&~1 &~5 &~verde)
    =>
    (retract ?d)
    (retract ?t)
    (retract ?h)
    (assert (todos-los-datos $?a ?x))
)