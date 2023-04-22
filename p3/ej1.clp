;Crear una función genérica para extraer N elementos de una cadena o de un
;valor multicampo. La función recibirá como parámetros en los dos casos el
;índice del primer y último elemento a extraer y como tercer parámetro la
;cadena o multicampo sobre los que realizar la extracción.

(deffunction extract(?begin ?end $?slot)
    (if (not (stringp $?slot)) then
        (loop-for-count (?begin ?end) 
            do
            (bind ?actual (nth$ ?begin $?slot))
            (printout t "Elemento: " ?actual crlf)
        )

    else
        (bind ?actual (sub-string ?begin ?end $?slot))
        (printout t "Elemento: " ?actual crlf)
    )
)