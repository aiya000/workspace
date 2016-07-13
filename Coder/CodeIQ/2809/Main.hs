import Data.Ratio
import Control.Applicative ( (<$>) )

splitHalf :: Eq a => a -> [a] -> [[a]]
splitHalf x ys = [upper, downer]
  where
    upper  = takeWhile (/=x) $ ys
    downer = drop (length upper + 1) ys

formatToRatio :: (Integral a, Read a) => String -> [Ratio a]
formatToRatio = map listToRatio . map (map read . splitHalf '/') . splitHalf ' '
  where
    listToRatio :: Integral a => [a] -> Ratio a
    listToRatio [x,y] = x % y

ratioToString :: (Integral a, Show a) => Ratio a -> String
ratioToString qs =
  let q = numerator   qs
      r = denominator qs
  in show q ++ "/" ++ show r

main :: IO ()
main = do
  [q, r] <- formatToRatio <$> getLine
  putStrLn . ratioToString $ q + r
