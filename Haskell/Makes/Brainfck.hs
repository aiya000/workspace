import Control.Monad
import Control.Applicative
import System.Environment

main =
  head <$> getArgs >>= startFck


type FileName  = String
type Lines = [String]

--startFck :: FileName -> Lines
startFck fileName = do
  lines <- readFile fileName
  forM_ lines $ \o -> operate o


type Operate = Char

operate :: Operate -> IO ()
operate '+' = print '+'
operate _   = return ()

