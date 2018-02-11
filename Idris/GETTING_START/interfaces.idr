interface Coercible a b where
  cast : a -> b

Coercible Nat Int where
  cast = toIntNat

main : IO ()
main = pure ()
