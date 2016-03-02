(print "Hello, world!!")
(println "\nHomu!")

(println '(10 10.0 (+ 10 20))
         (cons 10 '(20))
         (first  '(1 2 3 4 5))
         (rest   '(1 2 3 4 5))
         (take 2 '(1 2 3 4 5))
         (+ 10 20)
         ((fn [x] (+ x 1)) 10))

(defn pair [x y] (cons x (cons y '())))
(println (pair 10 20))

(println
  ((fn fibo [x]
     (if (= x 0) 0
       (if (= x 1) 1
         (+ (fibo (- x 1)) (fibo (- x 2)))))) 6))
