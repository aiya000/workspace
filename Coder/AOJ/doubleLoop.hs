import Control.Monad

main = hoge
hoge = do
  forM [1..100] $ \i -> do
    nums <- forM [1..i] $ \j -> do
      return (i*j)
    putStrLn $ show nums
