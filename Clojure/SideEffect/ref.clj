(def foo (ref #{\a \b \c \d \e}))
; @ is dereference
(println foo)
(println @foo)
(println (deref foo)) ; deref same as @
; Start thread safe parallel transaction (dosync)
; Change refered-value (ref-set)
; The reference changing needed dosync
(dosync (ref-set foo #{0}))
(println @foo)
; Append
(dosync
  (alter foo conj 1)
  (alter foo conj 2)
  (alter foo conj 3)
  (alter foo conj 4)
  (alter foo conj 5)
  (alter foo conj 6))
(println @foo)
