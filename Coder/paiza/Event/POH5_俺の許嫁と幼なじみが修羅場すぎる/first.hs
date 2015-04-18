import qualified Data.Char as C


main :: IO ()
main = do
  s <- getLine
  putStrLn $ oddAlphas s


oddAlphas :: [Char] -> [Char]
oddAlphas []  = []
oddAlphas [c] = [c]
oddAlphas (c:_:cs) = c : oddAlphas cs
