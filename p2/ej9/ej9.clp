(deffacts datos
    (dato 1)
    (dato 5)
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
    ?d <- (dato ?x)
    ?t <- (todos-los-datos $?a)
    =>
    (retract ?d)
    (retract ?t)
    (assert (todos-los-datos $?a ?x))
)
