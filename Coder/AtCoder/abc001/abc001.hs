import Control.Applicative

main = do
  a <- readLn
  [b,c] <- map read . words <$> getLine
  d <- getLine
  putStrLn $ show (a + b + c) ++ " " ++ d
