import Control.Monad.ST (ST, runST)
import Data.STRef (newSTRef, modifySTRef, readSTRef)

main :: IO ()
main = print $ runST getSTRef

-- ST ReadWorld a <=> IO a
-- ( but we must not indeed specify `s` )
getSTRef :: ST s Int
getSTRef = do
  a  <- newSTRef 0
  modifySTRef a (+10)
  readSTRef a
