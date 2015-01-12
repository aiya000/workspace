import Data.List (sort)
import Control.Monad (replicateM)
import Control.Applicative ((<$>))


type Point   = (Int,Int)
type Slash   = (Point,Point)
type Polygon = [Point]


main :: IO ()
main = do
  points <- getNums
  topNum <- readLn
  tops   <- replicateM topNum getNums
  let slash   = listToSlash points
  let polygon = listToPolygon tops
  print $ slashes polygon slash

getNums :: IO [Int]
getNums = fmap read . words <$> getLine


listToSlash :: [Int] -> Slash
listToSlash xs = let [a,b,c,d] = xs
                 in  ((a,b), (c,d))

listToPolygon :: [[Int]] -> Polygon
listToPolygon xss = sort $ map lToP xss
  where
    lToP xs = let [a,b] = xs in (a,b)


slashes :: Polygon -> Slash -> Int
slashes pol sl = 
