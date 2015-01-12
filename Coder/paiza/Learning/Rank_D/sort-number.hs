import Data.List (sort)
import Control.Monad (replicateM)
import Control.Applicative ((<$>))


main :: IO ()
main = do
  n <- readLn
  m <- sort <$> replicateM n (readLn :: IO Int)
  mapM_ print m
