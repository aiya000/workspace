(import java.util.LinkedList)
(def llist (LinkedList.))

(println (.size llist))
;(println (. llist size))
(println (.getClass (.size llist)))
;(println (.. llist size getClass))

; Clojure's function is Java's Callable or Runnable
(.start (Thread. (fn []
  (do
    (Thread/sleep 10)
    (println "poi")))))
(do
  (println "poipoi")
  (Thread/sleep 10))
