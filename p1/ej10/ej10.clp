(deftemplate alumno "Representa información sobre un alumno"
    (slot apellidos (type STRING) (default ?NONE))
    (slot nombre (type STRING) (default ?NONE))
    (multislot grupo (type SYMBOL) (cardinality 1 4))
    (multislot notas (type INTEGER) (range 0 10) (default 0))
)