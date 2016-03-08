; Define java data type
(deftype Person [name age])
(def person (Person. "ahoge" 3))
(println (.name person))
(println (.age person))
(println person)

(println (:age person))
