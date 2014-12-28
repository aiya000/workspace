import Control.Monad
main = do
  let list = ["01", "11"]
      myOrder (n:l) = l ++ [reverse n]
  putStrLn $ show $ myOrder list
