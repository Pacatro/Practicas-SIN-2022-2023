;Crear una función genérica para extraer N elementos de una cadena o de un
;valor multicampo. La función recibirá como parámetros en los dos casos el
;índice del primer y último elemento a extraer y como tercer parámetro la
;cadena o multicampo sobre los que realizar la extracción.

(defmethod extract ((?begin NUMBER) (?end NUMBER) (?s STRING))
    (bind ?sub (sub-string ?begin ?end ?s))
    (printout t ?sub crlf)
)

(defmethod extract ((?begin NUMBER) (?end NUMBER) $?slot)
    (loop-for-count (?begin ?end) 
        do
        (bind ?actual (nth$ ?begin $?slot))
        (printout t "Elemento: " ?actual crlf)
    )
)
