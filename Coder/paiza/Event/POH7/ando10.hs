import Control.Applicative

main = do
  n <- read <$> getLine
  print $ foldr (*) 1 [2..n]
