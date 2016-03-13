(require '[lanterna.screen :as s])
(def scr (s/get-screen))

(s/start scr)
(s/put-string scr 10 10 "Hello")
(s/put-string scr 10 11 "Please hit any key")

(let [[width height] (s/get-size scr)]
  (s/put-string scr 0 0 (str width "/" height)))

(s/redraw scr)

(s/get-key-blocking scr)
(s/stop scr)
