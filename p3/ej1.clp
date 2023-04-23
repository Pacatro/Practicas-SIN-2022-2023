;Crear una función genérica para extraer N elementos de una cadena o de un
;valor multicampo. La función recibirá como parámetros en los dos casos el
;índice del primer y último elemento a extraer y como tercer parámetro la
;cadena o multicampo sobre los que realizar la extracción.

(deffunction extract(?begin ?end ?slot)

    (bind $?multi (explode$ ?slot))

    (loop-for-count (?begin ?end) 
        do
        (bind ?actual (nth$ ?begin $?multi))
        (printout t "Elemento: " ?actual crlf)
    )
)