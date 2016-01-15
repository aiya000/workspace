main = do
  let p x = (x `mod` 3 == 0) || (x `mod` 5 == 0)
  print $ sum . filter p $ [0..1000]
