; Branch by type
(defmulti echo class)
(defmethod echo String [s]
  (str "String>> " s))
(defmethod echo Number [n]
  (str "Number>> " n))
(defmethod echo nil [_]
  "nil>> value is nil")
(defmethod echo :default [x]
  (format "AnotherType(%s)>> %s" (class x) x))

(println (echo "string"))
(println (echo 10))
(println (echo 20.0))
(println (echo nil))
(println (echo \c))
(println (echo (fn [] '())))


; Chose higher order
(defmulti f class)
;; The vector is IPersistentVector and Collection
(def xs [1 2 3])
(defmethod f clojure.lang.IPersistentVector [_] :v)
(defmethod f java.util.Collection [_] :c)
;(println (f xs))  ;; Exception occured
; IPersistentVector is priority than Collection
(prefer-method f clojure.lang.IPersistentVector java.util.Collection)
(println (f xs))
