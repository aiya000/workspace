import Control.Monad.State

addEx :: Int -> State Bool Int
addEx n = do
  a <- get
  if a then put (n + 10)
       else put (n + 20)


main :: IO ()
main = do
  print $ runState addEx False
