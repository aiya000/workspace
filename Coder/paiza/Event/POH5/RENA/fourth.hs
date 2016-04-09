import Prelude hiding (foldl)
import Control.Applicative ((<$>))
import Control.Monad (replicateM, join)
import Data.List (sort,foldl)


--main :: IO ()
--main = do
--  [x,y,n] <- readsLn
--  table   <- getTable  y
--  ranges  <- getRange n
--  print $ sumTableNumInRange table ranges


readsLn :: IO [Int]
readsLn = map read . words <$> getLine


type Line  = [Int]
type Table = [Line]


getTable :: Int -> IO Table
getTable y = replicateM y readsLn


type Point = (Int,Int)
type Range = (Point,Point)

getRange :: Int -> IO [Range]
getRange n = replicateM n getPoint
  where
    getPoint = readsLn >>= \[x1,y1,x2,y2] -> return ((x1,y1), (x2,y2))


sumTableNumInRange :: Table -> [Range] -> Int
sumTableNumInRange table ranges =
  let rowRanges = rangesToRowsRange ranges
  in  sumRowNumInRowRange table rowRanges
