(deftemplate paciente "Datos pacientes"
    (slot nombre (type STRING))
    (slot apellidos (type STRING))
    (slot dni (type LEXEME) (default ?NONE))
    (slot seguro (type STRING))
)

(deftemplate cita_medico "Datos citas medico"
    (slot fecha (type INTEGER))
    (multislot sintomas (type LEXEME))
    (multislot pruebas (type LEXEME))
    (multislot medicacion (type SYMBOL))
)