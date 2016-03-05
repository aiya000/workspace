(def xs #{1 2 3 4 5 6 7 8 9 10})

(println
  (conj xs 0) ; conjuction
  (conj xs 1))
(println (clojure.set/union #{:a :b :c} #{:c :d :e}))
(println (clojure.set/superset? #{1 2 3} #{2}))
(println (clojure.set/subset? #{2} #{1 2 3}))
