xs : List Int
xs = 1 :: 2 :: 3 :: Nil

ys : List Int
ys = [1, 2, 3]

data Mine = Yours | My Mine

show' : Mine -> String
show' Yours = "Yours"
show' (My x) = "My " ++ show' x

main : IO ()
main = do
  printLn xs
  printLn ys
  putStrLn . show' $ My Yours
