(deftemplate animal "Representa un animal"
    (slot nombre (type STRING))
    (slot sonido (type STRING))
)

(deffacts animales "Diferentes animales"
    (animal (nombre "perro") (sonido "guauguau"))
    (animal (nombre "gato") (sonido "miaumiau"))
    (animal (nombre "pato") (sonido "cuakcuak"))
    (animal (nombre "vaca") (sonido "muuuuuu"))
    (animal (nombre "oveja") (sonido "beeeee"))
    (animal (nombre "gallo") (sonido "kikiriki"))
)

(defrule esanimal
    (animal (nombre ?n) (sonido ?s)) => (printout t "Se trata de un " ?n " y hace " ?s crlf)
)