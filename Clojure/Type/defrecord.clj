; Define clojure data type
(defrecord Person [name age])
(def person (Person. "ahoge" 3))
(println (.name person))
(println (.age person))
(println person)

(println (:age person))
