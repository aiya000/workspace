import Control.Applicative

main = do
  [x, y] <- map (read :: String -> Int) . words <$> getLine
  print $ max x y
