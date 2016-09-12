main :: IO ()
main = do
  [m, n] <- map read . words <$> getLine
  let steps = m - n
  if steps <= 0
     then print 0
     else print steps
