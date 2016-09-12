main :: IO ()
main = do
  a <- readLn
  b <- readLn
  h <- readLn
  print $ (a + b) * h `div` 2
