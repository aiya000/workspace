; define function
(defn succ [x] (+ x 1))
(def succ0 (fn [x] (+ x 1)))
; partial apply
(def succ1 #(+ % 1))
(def succ2 (partial + 1))

(println (succ  5))
(println (succ0 5))
(println (succ1 5))
(println (succ2 5))
