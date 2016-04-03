; Run IO to each
(doseq [x '(10 20 30)] (println x))
(defn p [a] (do (println a) true))
(doseq [x '(10 20 30) :when (p x)] (println x))
