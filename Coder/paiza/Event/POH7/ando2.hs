import Control.Applicative ((<$>))

read' :: String -> Int
read' = read

main :: IO ()
main = do
  n <- read' <$> getLine
  putStrLn . concat $ replicate n "Ann"
