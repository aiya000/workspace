import Control.Monad.State

tick :: State Int Int
tick = do
  n <- get
  put (n + 1)
  return n


main :: IO ()
main = do
  runState $ tick >> tick >> tick $ 0
