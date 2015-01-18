import Control.Monad (replicateM, forM)
import Control.Applicative ((<$>))


main :: IO ()
main = do
  [n,m] <- getNums
  pers  <- replicateM m getNums
  -- Stateモナド使いたい…。


getNums :: IO [Int]
getNums = map read . words <$> getLine


type Table = [Bool]  -- 席が空いているかいないか
type Point = Int            -- 位置
type Persons = (Int,Point)  -- 人数と位置の組


loopableTakeAtoB :: Int -> Int -> [a] -> [a]
loopableTakeAtoB a b xs =
  let top  = drop (a - 1) xs
      n    = b - (a - 1)
      body = let restN = n - length top
             in  if length top >= n then take n top
                 else top ++ take restN xs
  in  body

takeSeat :: Table -> Persons -> Maybe Table
takeSeat table pers =
  let (num, startP) = pers
      table'  = loopableTakeAtoB startP num table
      takeOK  = not $ all (==True) table'
      table'' = take (startP - 1) table
                ++ replicate num True
                ++ drop (startP - 1 + num) table
  in  if takeOK then Just table'' else Nothing
