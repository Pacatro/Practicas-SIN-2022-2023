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
    (dato ?x)
    (not (todos-los-datos $? ?x $?))
    ?t <- (todos-los-datos $?a)
    =>
    (retract ?t)
    (assert (todos-los-datos $?a ?x))
)