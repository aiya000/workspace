main :: IO ()
main = do
  p <- readLn
  let basePoint = p `div` 100
  let point     = if p >= 1000 then basePoint + 10 else basePoint
  print point
