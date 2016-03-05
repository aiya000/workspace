(require 'clojure.string '[clojure.pprint :as pp])
(println (clojure.string/join "," ["foo" "bar"]))
(pp/pprint '(1 2))

(require '[clojure.java.io :refer [file]]
         '[clojure.reflect :refer :all])
(println (typename (class (file "foo.txt"))))

; same (require .. :refer [.. ..])
(use '[clojure.set :only [intersection union]])
(println (intersection #{1 2 3} #{2 3 4}))
(println (union        #{1 2 3} #{2 3 4}))
