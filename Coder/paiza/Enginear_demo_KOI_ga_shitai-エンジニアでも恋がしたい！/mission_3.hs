import Control.Monad

type Bar    = [Int]
type BarLen = Int
type SelectLen = Int
type Damage    = Int


main :: IO ()
main = getLengths  >>= \(rLen,bLen) ->
       getBar bLen >>= \bar         ->
       print $ criticalDamage bar rLen


getLengths :: IO (BarLen,SelectLen)
getLengths = getLine >>=
             return . map read . words >>= \(x:y:_) ->
             return (x,y)


getBar :: BarLen -> IO Bar
getBar n = replicateM n getLine >>= return . map read


criticalDamage :: Bar -> SelectLen -> Damage
criticalDamage xs n = foldr max 0 $ damages xs n
  where
    damages ys m  = foldr (\a b -> fst a + snd a : b) [] $ fakeZip m $ stairs m ys
    stairs m' ys' = scanl (\a _ -> tail a) ys' [2..m']
    newZipper ys' = ([map head ys'], map tail ys')
    upZipper  t   = let as = fst t
                        bs = snd t
                    in (as ++ [map head bs], map tail bs)
    --fakeZip :: Int -> [[a]] -> [[a]]
    -- fakeZip 4 [[1..3], [2..4], [3..5], [4..6]] => [[1,2,3,4], [2,3,4,5], [3,4,5,6]]
    --  fakeZip 4 [ys, (tail ys), (tail $ tail ys), (tail $ tail $ tail ys), (tail $ tail $ tail $ tail ys)]
    --fakeZip 4 $ stairs 4 ys
    -- --let newZipper ys = map head ys : map tail ys
    fakeZip l zs = 
