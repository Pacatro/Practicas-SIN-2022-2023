(deftemplate coche "Define los datos de un coche"
    (slot cantidad (type INTEGER) (default ?NONE))
    (slot nombre (type SYMBOL) (default ?NONE))
    (slot precio (type INTEGER) (default ?NONE))
    (slot combustible (type SYMBOL) (default ?NONE))
    (slot n_puertas (type INTEGER) (default ?NONE))
    (slot color (type SYMBOL) (default ?NONE))
)

(deftemplate venta "Define los datos de una venta"
    (slot vendedor (type STRING) (default ?NONE))
    (slot coche (type SYMBOL) (default ?NONE))
    (slot fecha_venta (type LEXEME) (default ?NONE))
    (slot cliente (type STRING) (default ?NONE))
)