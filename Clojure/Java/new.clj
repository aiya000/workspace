(import java.util.ArrayList)
(def arrayList (new ArrayList))
;(def arrayList (ArrayList.))

(loop [x 0]
  (if (> x 10)
    nil
    (do
      (.add arrayList x)
      (recur (inc x)))))
(println arrayList)
