xs : List Int
xs = 1 :: 2 :: 3 :: Nil

ys : List Int
ys = [1, 2, 3]

main : IO ()
main = do
  printLn xs
  printLn ys
