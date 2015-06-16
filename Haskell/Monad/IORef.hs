import Data.IORef
import Control.Monad

main = using


{- Basic -}

test = do
  a <- newIORef 0
  readIORef a >>= print

using = do
  a <- newIORef 0
  forM_ [1..10] $ \i -> do
    modifyIORef a (+i)
  readIORef a >>= print
