(import clojure.lang.ExceptionInfo)

(try
  (throw (ex-info "(poi poi)" {}))
  (catch ExceptionInfo e
    (println "caught: " e))
  (finally
    (println "done")))
