(def xs '(1 2 3 4 5 6 7 8 9 10))

(println (list :a :b :c))

(println
  (first xs)
  (rest xs)
  (second xs)
  (last xs)
  (nth xs 2)
  (take 5 xs)
  (cons 20 xs))

(println
  (reduce + 0 xs)
  (map (fn [x] (+ x 1)) xs)
  (filter (fn [x] (= (mod x 2) 0)) xs))

(println
  (take 10 (repeat 1))
  (take 30 (cycle xs))
  (take 10 (iterate (fn [x] (+ x 2)) 0)))
