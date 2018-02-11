record TheNat (n : Nat) where
  constructor ANat
  natVal : Nat

Show (TheNat n) where
  show {n = val} _ = "A nat " ++ show val

x : TheNat 10
x = ANat 10

main : IO ()
main = printLn x
-- {output}
-- An int 10
