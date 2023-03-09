(deftemplate libro "Define los datos de un libro"
    (multislot autor/es (type STRING) (default ?NONE))
    (slot titulo (type STRING) (default ?NONE))
    (slot edicion (type INTEGER))
    (slot editorial (type STRING) (default ?NONE))
    (slot año_publicacion (type INTEGER) (default ?NONE))
)

(deffacts bibliografía "Bibliografía de la asignatura de SIN"
    (libro (autor/es "Mira, J." "Delgado, A. E." "Boticario, J. G." "Díez, F. J.")
           (titulo "Aspectos Básicos de la Inteligencia Artificial.")
           (editorial "Sanz y Torres")
           (año_publicacion 1995)
    )

    (libro (autor/es "Galán, S. F." "Boticario, J. G." "Mira, J.")
           (titulo "Problemas Resueltos de Inteligencia Artificial Aplicada: Búsqueda y Representación.")
           (editorial "Addison-Wesley Iberoamericana S. A.")
           (año_publicacion 1998)
    )

    (libro (autor/es "Rich, E." "Rich, E.")
           (titulo "Inteligencia Artificial.")
           (edicion 2)
           (editorial "McGraw-Hill Interamericana.")
           (año_publicacion 1994)
    )
)