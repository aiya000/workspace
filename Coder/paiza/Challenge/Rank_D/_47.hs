
main :: IO ()
main = do
  n <- readLn
  putStrLn $ if odd n then "odd" else "even"

{- 問題にHaskellで望んだものの
   回答可能言語にHaskellがなかった時の心情を答えよ
-}
