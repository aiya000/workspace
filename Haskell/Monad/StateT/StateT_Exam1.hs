import Control.Monad.State
import Control.Monad.Identity


return' :: a -> StateT s Identity a
return' a = return a

runState' :: StateT s Identity a -> s -> (a, s)
runState' st = \s -> runIdentity $ runStateT st s


main :: IO ()
main = do
  let st = return' 10
  print $ runState' st ()
