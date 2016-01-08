main = do
  w <- getLine
  let w' = [c | c <- w, c /= 'a' && c /= 'i' && c /= 'u' && c /= 'e' && c /= 'o']
  putStrLn w'
