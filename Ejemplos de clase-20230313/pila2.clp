(deffacts init-estructuras-datos
	(dato 1)
    (elementos 5)
    (pila)
)

(defrule push_n_elements
    (declare (salience 20))
	?pila <- (pila $?x)
    ?n_el <- (elementos ?n &: (> ?n 1))
	?dato <- (dato ?y &: (numberp ?y))
	=>
	(retract ?pila ?dato ?n_el)
	(assert (pila ?y $?x))
    (assert (dato (+ ?y 1)))
    (assert (elementos (- ?n 1)))
)
