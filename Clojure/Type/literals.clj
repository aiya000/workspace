(println 10)
(println 10.0)
(println "foo")        ; str
(println '(1 2 3))     ; list
(println #{1 2 3})     ; set
(println :keyword)     ; keyword
(println {:a 1 :b 2})  ; hash-map

; constructors
(println (str 10))
(println (set '(1 2 3)))
(println (keyword "hello"))
(println (hash-map :a 1 :b 2))
