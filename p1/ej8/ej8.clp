(deftemplate cocina "Ingredientes que componen un plato"
    (multislot prod_cocina (type SYMBOL) (default ?NONE))
    (multislot prod_comprar (type SYMBOL) (default Ninguno))
)

(deffacts situacion1 "Situación 1: Faltan ingredientes"
    (cocina (prod_cocina pimientos_verdes pimientos_rojos cebollas aceite)
            (prod_comprar berenjenas calabacines tomate_triturado sal huevos patatas)
    )
)

