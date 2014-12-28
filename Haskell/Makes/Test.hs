import System.IO
import Control.Exception


main = cat "LineEditor.hs"

cat :: FilePath -> IO ()
cat filename = do
  bracket
    (openFile filename ReadMode)
    (hClose)
    (\h -> do
      contents <- hGetContents h
      putStr contents)
