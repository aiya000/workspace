import Control.Applicative ((<$>))
import Control.Monad (forM, replicateM)


main :: IO ()
main = do
  n   <- readLn
  xss <- soldPrice n
  let m = foldr1 plusWeekPrice xss
  mapM_ print m


soldPrice :: Int -> IO [[Int]]
soldPrice days = replicateM loopLen getPriceWeekly
  where
    weekDays       = 7
    loopLen        = days `div` weekDays
    getPriceWeekly = replicateM weekDays readLn

plusWeekPrice :: [Int] -> [Int] -> [Int]
plusWeekPrice [a1,b1,c1,d1,e1,f1,g1] [a2,b2,c2,d2,e2,f2,g2] =
  [a1 + a2, b1 + b2, c1 + c2, d1 + d2, e1 + e2, f1 + f2, g1 + g2]
