import Control.Applicative ((<$>))

main :: IO ()
main = do
  n <- read <$> getLine
  m <- read <$> getLine
  print $ n + m
