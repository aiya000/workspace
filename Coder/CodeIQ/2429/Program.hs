import Data.List (intercalate)
import Control.Applicative ((<$>))


main :: IO ()
main = do
  input <- zip [0,1..] . splitOn ',' <$> getLine
  let result = map mapping input
  putStrLn . init . tail . show $ result

splitOn :: (Eq a) => a -> [a] -> [[a]]
splitOn a b = inner_split a b []
  where inner_split t [] lis = [lis]
        inner_split t (h:rest) lis | h == t    = lis:(inner_split t rest [])
                                   | otherwise = inner_split t rest (lis ++ [h])


mapping :: (Int,String) -> Int
mapping (_, "CodeIQ") = 15
mapping (_, "IQ"    ) =  5
mapping (_, "Code"  ) =  3
mapping (x, _       ) =  x
