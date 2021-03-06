; define function
(defn succ [x] (+ x 1))
(def succ0 (fn [x] (+ x 1)))
; partial apply
(def succ1 #(+ % 1))
(def succ2 (partial + 1))
(def add #(+ %1 %2))
;
(defn f
  ([] 10)
  ([x] (+ 10 x)))

(println (succ  5))
(println (succ0 5))
(println (succ1 5))
(println (succ2 5))
(println (add 1 2))

(println (f))
(println (f 10))
