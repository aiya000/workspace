; Define interface
(defprotocol PersonActions
  (walk [this])
  (tornado [this target]))

; Implement
(defrecord Person [name age]
  PersonActions
  (walk [this] (println (str this " walking now")))
  (tornado [this target] (str target " Doooon!!!!")))

(def person (Person. "ahoge" 13))
(walk person)
(println (tornado person "Ika"))

; Multi implementation
(defprotocol MaidActions (wear-maid-dress [this]))
(defrecord Maid [name age attr]
  PersonActions
  MaidActions
  (walk [this] (println "sharanra sharanra"))
  (tornado [this target] (str "goho-shi tornado !! >>> " target))
  (wear-maid-dress [this] "/// KiraKira-rin ///"))
(def maid (Maid. "ahoge" 13 "pettan"))
(walk maid)
(println (tornado maid "Ika"))
(println (wear-maid-dress maid))
