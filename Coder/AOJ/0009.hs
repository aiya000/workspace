
main = putStrLn $ show $ divisorList 120

divisorList m = takeWhile (<=m) $ 2 : f [3,5..]
  where
    f (x:xs) = x : f [y| y <- tail xs, y `mod` x /= 0]



