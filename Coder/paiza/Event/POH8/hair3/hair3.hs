main :: IO ()
main = do
  n <- readLn
  if n `mod` 7 == 0
     then putStrLn "lucky"
     else putStrLn "unlucky"
