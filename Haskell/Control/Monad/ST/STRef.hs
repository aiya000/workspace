-- STRef like IORef
-- but STRef run in another thread(not main thread)
-- and STRef closed in ST `s` a
import Control.Monad.ST (ST, runST)
import Data.STRef (newSTRef, modifySTRef, readSTRef)

main :: IO ()
main = do
  print $ pureFunc 1 2
  print $ runST getSTRef


-- Look like pure function
pureFunc :: Int -> Int -> Int
pureFunc x y = runST $ do
  x' <- newSTRef x
  modifySTRef x' (+ y)
  readSTRef x'


-- ! Bad use case (not closed case)
-- ST ReadWorld a <=> IO a
-- ( but we must not indeed specify `s` )
getSTRef :: ST s Int
getSTRef = do
  a  <- newSTRef 0
  modifySTRef a (+10)
  readSTRef a
