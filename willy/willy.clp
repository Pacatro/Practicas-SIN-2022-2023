
(defrule fireWilly
	(hasLaser)
	(directions $? ?direction $?)
	=>
	(fireLaser ?direction)
	)

(deffacts estadoInicial "Estado inicial del sistema"
    (hice nada) ; Hecho para la última acción que realizó Willy
    (nMovimientos 0) ; Número de pasos que ha dado Willy
)

(defrule moveWilly "Mueve a willy en una dirección elegida al azar, siempre que no haya amenazas actualmente"
    (directions $? ?direction $?)
    ?h <- (hice $?)
    (not (or (percepts Pull $?) (percepts Noise $?))) ; No se detecta ningún peligro
    ?m <- (nMovimientos ?n &:(< ?n 1000)) ; No se ha alcanzado el número máximo de pasos
    =>
    (retract ?h)
    (assert (hice ?direction)) ; Apuntar el movimiento que se hizo para que se puede volver a él si hay un peligro
	(retract ?m)
    (assert (nMovimientos (+ ?n 1))) ; Incrementar el número de pasos
    (moveWilly ?direction)
)

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
