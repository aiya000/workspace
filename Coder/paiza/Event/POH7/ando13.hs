import Control.Applicative ((<$>))
import Data.List (foldr1)

fact :: Integer -> Integer
fact n = foldr1 (*) [1..n]


main :: IO ()
main = do
  n <- read <$> getLine
  let str  = show . fact $ n
      str' = dropWhile (=='0') . reverse . take 9 . dropWhile (=='0') . reverse $ str
  putStrLn str'
