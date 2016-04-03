; apply sequence
(def xs (-> [1 2 3] reverse (#(map inc %))))
(println xs)
