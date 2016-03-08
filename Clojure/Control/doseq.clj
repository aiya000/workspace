; for (var x in {10, 20, 30}) {
;   println(x);
; }
(doseq [x '(10 20 30)]
  (println x))
