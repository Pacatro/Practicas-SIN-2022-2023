(deftemplate persona "persona ej1"
    (slot nombre (type STRING))
    (slot apellidos (type STRING))
    (slot color_ojos (type SYMBOL))
    (slot altura (type FLOAT) (default 1.7))
    (slot edad (type INTEGER) (default 20))
)