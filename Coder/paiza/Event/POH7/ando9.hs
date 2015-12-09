import Control.Applicative ((<$>))
import Control.Monad (replicateM)
import Data.List (intercalate)

main :: IO ()
main = do
  n     <- read <$> getLine
  names <- replicateM n getLine
  putStrLn $ intercalate "_" names
