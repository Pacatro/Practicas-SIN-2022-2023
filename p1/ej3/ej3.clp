(deftemplate nodo "Datos de un nodo"
    (slot origen (type SYMBOL) (default ?NONE))
    (multislot destinos (type SYMBOL) (default Ninguno))
)

(deffacts vuelos "Datos de los difrentes vuelos"
    (nodo (origen Lisboa) (destinos París Madrid))
    (nodo (origen París) (destinos Roma))
    (nodo (origen Estocolmo) (destinos París))
    (nodo (origen Frankfurt) (destinos Estocolmo Roma))
    (nodo (origen Roma) (destinos Lisboa Frankfurt Madrid))
    (nodo (origen Madrid))
)