(require '[clojure.java.io :refer [file delete-file]])
(def filePath "foo.txt")

; Create file and Output to file
(spit filePath "foo\nbar")
(let [f (file filePath)]
  (println (.exists f)))

; Append detail
(spit filePath "\nbaz" :append true)
;(spit filePath "\nbaz" :append true :encoding "UTF-8")

; Read file detail
(println (slurp filePath))
;(println (slurp filePath) :encoding "UTF-8")
(delete-file filePath)

; !?
;(println (slurp "http://google.co.jp"))
