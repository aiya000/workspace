data AnInt : (x : Int) -> Type where
  IntVal : Int -> AnInt x

Show (AnInt x) where
  show {x = val} _ = "An int " ++ show val

x : AnInt 10
x = IntVal 10

main : IO ()
main = printLn x
-- {output}
-- An nat 10
