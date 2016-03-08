(loop [x 5 y 0]
  (if (zero? x)
    nil
    (do (println y)
      (recur (dec x) (+ x y)))))
