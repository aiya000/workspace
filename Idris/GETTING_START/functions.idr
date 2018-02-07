%hide plus

plus : Nat -> Nat -> Nat
plus Z     m = m
plus (S n) m = S (plus n m)

main : IO ()
main = do
  print $ plus (S Z) (S (S Z))
