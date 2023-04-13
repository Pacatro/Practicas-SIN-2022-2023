(deffacts datos
    (dato 1)
    (dato 5)
    (dato verde)
    (dato hola)
    (dato 9)
)

(defrule todosLosDatos
    ?h<-(dato ?x)
    ?t<-(todos-los-datos $?a)
    =>
    (retract ?t)
    (assert (todos-los-datos ?h))
)