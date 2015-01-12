import Control.Monad

read' :: String -> Int
read' = read

readInt :: IO Int
readInt = liftM read' getLine

main :: IO ()
main = readInt >>= \n ->
       sequence (replicate n readInt) >>=
       print . sum >>
       return ()
