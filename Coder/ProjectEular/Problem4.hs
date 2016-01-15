main = do
  let xs = [x * y | x <- [100..999], y <- [100..999]]
  print $ last . filter palindrome $ xs

show' :: Integer -> String
show' = show

palindrome :: Integer -> Bool
palindrome x =
  let a = show' x
      b = reverse . show' $ x
  in a == b
