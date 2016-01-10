-- incomplete
import Control.Monad
import Control.Applicative
import Data.List

main = do
  [xs, ys] <- group . sort  <$> replicateM 5 getLine
  putStrLn $ if length xs < length ys then "yes" else "no"
