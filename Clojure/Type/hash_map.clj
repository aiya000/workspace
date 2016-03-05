(def foo {:a 1 :b 2})
(println (foo :a))
(println (:a foo))

(println (:a {:b 20} 10))
(println (:b {:b 20} 10))

(println (conj {:a 10} {:b 20}))
