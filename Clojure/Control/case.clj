(def x 10)
(cond
  (= x 10) (println "a")
  (= x 20) (println "b")
  :else    (println "c"))

(case x
  10 (println "a")
  20 (println "b")
     (println "c"))
