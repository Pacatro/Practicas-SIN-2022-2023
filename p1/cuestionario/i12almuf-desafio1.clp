(deftemplate jugador "Datos jugador"
    (slot nombre (type STRING) (default ?NONE))
    (slot tipo_bola (type SYMBOL) (allowed-symbols lisa rayada negra por-determinar) (default por-determinar))
    (multislot historial (type SYMBOL) (allowed-symbols victoria derrota))
    (slot numero_faltas (type INTEGER) (range 0 999) (default 0))
)

(deftemplate mesa "Datos mesa"
    (slot lisas (type INTEGER) (range 0 7) (default 0))
    (slot rayadas (type INTEGER) (range 0 7) (default 0))
    (multislot jugadores (type STRING) (cardinality 2 2))
    (multislot bolas_anotadas (type INTEGER) (cardinality 0 15) (range 1 15))
)

(deffacts jugadores "Jugadores de la partida"
    (jugador (nombre "Ana") (tipo_bola lisa) (historial victoria))
    (jugador (nombre "Juan") (tipo_bola rayada) (numero_faltas 2))
)

(deffacts partida "Datos de la partida"
    (mesa (lisas 5) (rayadas 6) (jugadores "Ana" "Juan") (bolas_anotadas 7 3 9))
)