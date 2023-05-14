
(defrule fireWilly
	(hasLaser)
	(directions $? ?direction $?)
	=>
	(fireLaser ?direction)
	)

(deffacts estadoInicial "Estado inicial del sistema"
    (hice nada) ; Hecho para la última acción que realizó Willy
    (nMovimientos 0) ; Número de pasos que ha dado Willy
    (visitado 0 0)
    (estoy 0 0)
)

;(defrule moveWilly "Mueve a willy en una dirección elegida al azar, siempre que no haya amenazas actualmente"
;    (declare (salience -1))
;    (directions $? ?direction $?)
;    ?h <- (hice $?)
;    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
;    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
;    =>
;    (retract ?h)
;    (assert (hice ?direction)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
;	(retract ?m)
;    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
;    (moveWilly ?direction)
;)

;Mover Willy a las diferentes direcciones.
(defrule moveWillyNorth "Mover Willy hacia el norte cuando este encerrado, siempre que no haya amenazas actualmente"
    (declare (salience -1))
    (directions $? north $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    ?e <- (estoy ?x ?y)
    =>
    (retract ?h)
    (assert (hice north)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (estoy ?x (+ ?y 1)))
    (moveWilly north)
)

(defrule moveWillySouth "Mover Willy hacia el sur cuando este encerrado, siempre que no haya amenazas actualmente"
    (declare (salience -1))
    (directions $? south $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    ?e <- (estoy ?x ?y)
    =>
    (retract ?h)
    (assert (hice south)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (estoy ?x (- ?y 1)))
    (moveWilly south)
)

(defrule moveWillyEast "Mover Willy hacia el este cuando este encerrado, siempre que no haya amenazas actualmente"
    (declare (salience -1))
    (directions $? east $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    ?e <- (estoy ?x ?y)
    =>
    (retract ?h)
    (assert (hice east)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (estoy (+ ?x 1) ?y))
    (moveWilly east)
)

(defrule moveWillyWest "Mover Willy hacia el oeste cuando este encerrado, siempre que no haya amenazas actualmente"
    (declare (salience -1))
    (directions $? west $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    ?e <- (estoy ?x ?y)
    =>
    (retract ?h)
    (assert (hice west)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (estoy (- ?x 1) ?y))
    (moveWilly west)
)

;Reglas para mover Willy de manera inteligente

(defrule moveWillyNorteInteligente "Mover Willy de forma inteligente hacia el norte"
    (directions $? north $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    ?e <- (estoy ?x ?y)
    (not (visitado ?x ?a&:(= ?a (+ ?y 1))))
    =>
    (retract ?h)
    (assert (hice north)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (visitado ?x (+ ?y 1)))
    (retract ?e)
    (assert (estoy ?x (+ ?y 1)))
    (moveWilly north)
)

(defrule moveWillySurInteligente "Mover Willy de forma inteligente hacia el sur"
    (directions $? south $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    (visitado ?x ?y)
    ?e <- (estoy ?a ?b)
    (not (visitado ?x ?a&:(= ?a (- ?y 1))))
    =>
    (retract ?h)
    (assert (hice south)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (visitado ?x (- ?y 1)))
    (retract ?e)
    (assert (estoy ?x (- ?y 1)))
    (moveWilly south)
)

(defrule moveWillyEsteInteligente "Mover Willy de forma inteligente hacia el este"
    (directions $? east $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    ?e <- (estoy ?x ?y)
    (not (visitado ?a&:(= ?a (+ ?x 1)) ?y))
    =>
    (retract ?h)
    (assert (hice east)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (visitado (+ ?x 1) ?y))
    (retract ?e)
    (assert (estoy (+ ?x 1) ?y))
    (moveWilly east)

)

(defrule moveWillyOesteInteligente "Mover Willy de forma inteligente hacia el oeste"
    (directions $? west $?)
    ?h <- (hice $?)
    (and (not (percepts Noise $?)) (not (percepts Pull $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    ?e <- (estoy ?x ?y)
    (not (visitado ?a&:(= ?a (- ?x 1)) ?y))
    =>
    (retract ?h)
    (assert (hice west)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (assert (visitado (- ?x 1) ?y))
    (retract ?e)
    (assert (estoy (- ?x 1) ?y))
    (moveWilly west)
)

;Reglas para hacer que Willy retroceda

(defrule volverNorthWilly "Retroceder cuando el movimiento realizado previamente fue al norte"
    (directions $? south $?)
    ?h <- (hice north) ; Condición para que esta regla se ejecute sólo para volver de un movimiento hacia arriba
    (percepts Pull | Noise $?) ; Se detecta algún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
        =>
    (retract ?h) 
    (assert (hice south)); No hace falta apuntar lo que se hizo
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (moveWilly south); Mover a willy en la dirección contraria
)

(defrule volverSouthWilly "Retroceder cuando el movimiento realizado previamente fue al sur"
    (directions $? north $?)
    ?h <- (hice south) ; Condición para que esta regla se ejecute sólo para volver de un movimiento hacia abajo
    (percepts Pull | Noise $?) ; Se detecta algún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    =>
    (retract ?h)
    (assert (hice north)); No hace falta apuntar lo que se hizo
	(retract ?m)
    (moveWilly north) ; Mover a willy en la dirección contraria
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
)

(defrule volverWestWilly "Retroceder cuando el movimiento realizado previamente fue al oeste"
    (directions $? east $?) 
    ?h <- (hice west) ; Condición para que esta regla se ejecute sólo para volver de un movimiento hacia la izquierda
    (percepts Pull | Noise $?) ; Se detecta algún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
        =>
    (retract ?h)
    (assert (hice east)); No hace falta apuntar lo que se hizo
	(retract ?m)
    (moveWilly east) ; Mover a willy en la dirección contraria
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
)

(defrule volverEastWilly "Retroceder cuando el movimiento realizado previamente fue al este"
    (directions $? west $?)
    ?h <- (hice east) ; Condición para que esta regla se ejecute sólo para volver de un movimiento hacia la derecha
    (percepts Pull | Noise $?) ; Se detecta algún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
        =>
    (retract ?h)
    (assert (hice west)); No hace falta apuntar lo que se hizo
	(retract ?m)
    (moveWilly west) ; Mover a willy en la dirección contraria
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
)

(defrule fireWilly "En caso de percibir algún sonido, dispara en una dirección aleatoria"
    (hasLaser)
    (percepts $? Noise $?)
    (directions $? ?direction $?)
    =>
    (fireLaser ?direction)
)
