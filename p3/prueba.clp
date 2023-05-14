(defmethod myfun () myfun-1)
(defmethod myfun (?a ?b) myfun-2)
(defmethod myfun ((?a NUMBER) (?b NUMBER)) myfun-3)
(defmethod myfun ((?a INTEGER) (?b FLOAT)) myfun-4)
(defmethod myfun ((?a INTEGER (oddp ?a)) (?b FLOAT)) myfun-5)

(myfun 3.0 5.0)

(defgeneric)