(deftemplate plato "Ingredientes que componen un plato"
    (slot nombre (type STRING) (default ?NONE))
    (multislot ingredientes (type SYMBOL))
)

(deffacts cocinar "Platos que se preparan en la cocina"
    (plato (nombre "Pisto") 
           (ingredientes pimientos_verdes pimientos_rojos cebollas aceite)
    )
    
    (plato (nombre "Tortilla de patatas")
           (ingredientes )    
    )
)