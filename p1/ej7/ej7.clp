(deftemplate animal "Datos animales"
    (slot clase (type SYMBOL) (default ?NONE))
    (slot especie (type SYMBOL) (default ?NONE))
    (slot tipo (type SYMBOL))
    (multislot nombre (type SYMBOL) (default ?NONE))
)

(deffacts Animales "Datos del esquema de animales"
    (animal (clase Mamífero) (especie Roedores) (nombre Rata Ardilla))
    (animal (clase Mamífero) (especie Felinos) (nombre Tigre Lince Jaguar))
    (animal (clase Reptiles) (especie Serpientes) (nombre Boa Cobra))
    (animal (clase Aves) (especie Rapaces) (tipo Diurnas) (nombre Halcón Gavilán))
    (animal (clase Aves) (especie Rapaces) (tipo Nocturnas) (nombre Búho Lechuza))
)