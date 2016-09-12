-- imcompleted...
import Control.Monad (forM)
import Data.List (group)
import Data.Maybe (fromJust)

main :: IO ()
main = do
  _ <- getLine
  s <- getLine
  t <- getLine
  let countS = countUp s
  let countT = countUp t

type Count        = Int
type CharCountMap = [(Char, Count)]

countUp :: [Char] -> CharCountMap
countUp chars =
  let idx = map head   . group $ chars
      cnt = map length . group $ chars
  in zip idx cnt

type Nat = Int  -- :P
toNat :: Int -> Nat
toNat x | x < 0     = abs x
        | otherwise = x

f :: State CharCountMap CharCountMap -> Int
f x = 
