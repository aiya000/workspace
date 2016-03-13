(def data (atom #{}))

(swap! data conj "ahoge")
(swap! data conj "poi")

(println (deref data))
;(println @data)
