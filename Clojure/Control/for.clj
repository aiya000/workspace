(def xs
  (for [x '(10 20 30)] (+ x 1)))
(def ys
  (for [y '(0 1 2 3 4 5) :when (even? y)] y))
(def zs
  (for [z '(0 1 2 3 4 5)
        :let [a (* z z)]
        :when (even? a)] a))
(def vs
  (for [a '(1 2 3) b '(1 2 3)] [a b]))
(def us
  (for [u (range) :while (<= u 10)] (* u 2)))

(println xs)
(println ys)
(println zs)
(println vs)
(println us)
