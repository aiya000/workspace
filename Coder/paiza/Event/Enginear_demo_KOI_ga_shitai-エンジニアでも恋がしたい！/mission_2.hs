import Control.Monad
import Control.Applicative


readGoods :: IO (Int,Int,Int)
readGoods = do
  a <- words <$> getLine
  let [b,c,d] = map (read :: String -> Int) a
  return (b,c,d)

calc :: [(Int,Int,Int)] -> Int
calc [] = 0
calc (x:xs) = let (a,b,c) = x
                  price'  = (a - b) * c
                  price   = if price' >= 0 then price' else 0
              in  price + (calc xs)

body :: IO Int
body = readLn >>= \n ->
       replicateM n readGoods >>=
       return . calc

main :: IO ()
main = body >>= print
