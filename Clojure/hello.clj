(print "Hello, world!!")
(println "\nHomu!")
(println '(10 10.0 (+ 10 20))
         (cons 10 '(20))
         (first  '(1 2 3 4 5))
         (rest   '(1 2 3 4 5))
         (take 2 '(1 2 3 4 5))
         (+ 10 20)
         ((fn [x] (+ x 1)) 10))

; anonymous function
(println
  ((fn fibo [x]
     (if (= x 0) 0
       (if (= x 1) 1
         (+ (fibo (- x 1)) (fibo (- x 2)))))) 6))

; define function
(defn pair [x y] (cons x (cons y '())))
(println (pair 10 20))

; define variable
(def foo "fooaa")
(println foo)
(def foo "baaaa")
(println foo)
