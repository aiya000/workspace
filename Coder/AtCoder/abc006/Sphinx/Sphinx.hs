
sphinx n m =
  let adtFoot = 2
      oldFoot = 3
      chdFoot = 4
  in  m `div` n 

main = do
  [persons,foots] <- (map read . words) <$> getLine
  print $ sphinx persons foots
