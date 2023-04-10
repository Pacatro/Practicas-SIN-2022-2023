(deffacts animales "Diferentes animales"
    (sonido "guauguau")
    (sonido "miaumiau")
    (sonido "cuakcuak")
    (sonido "muuuuuu")
    (sonido "beeeee")
    (sonido "kikiriki")
)

(defrule esgallo
    (sonido "kikiriki") => (printout t "Se trata de un gallo" crlf)
)

(defrule esperro
    (sonido "guauguau") => (printout t "Se trata de un perro" crlf)
)

(defrule esgato
    (sonido "miaumiau") => (printout t "Se trata de un gato" crlf)
)

(defrule espato
    (sonido "cuakcuak") => (printout t "Se trata de un pato" crlf)
)

(defrule esvaca
    (sonido "muuuuuu") => (printout t "Se trata de un vaca" crlf)
)

(defrule esoveja
    (sonido "beeeee") => (printout t "Se trata de un oveja" crlf)
)