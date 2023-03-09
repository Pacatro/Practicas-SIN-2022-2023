(deftemplate miembro "Datos de un mienbro de una familia"
    (slot nombre (type STRING) (default ?NONE))
    (slot relacion (type SYMBOL))
)

(deffacts familia "Relaciones de una familia"
    (miembro (nombre "Dionisio") (relacion Abuelo))
    (miembro (nombre "Alicia") (relacion Abuela))
    (miembro (nombre "Paco") (relacion Padre))
    (miembro (nombre "Ana") (relacion Madre))
    (miembro (nombre "Paco") (relacion Hijo))
    (miembro (nombre "Ana") (relacion Hija))
)
