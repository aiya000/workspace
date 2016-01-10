import Test.QuickCheck

class Semigroup a where
  sappend :: a -> a -> a

sgLaw :: (Semigroup a, Eq a) => a -> a -> a -> Bool
sgLaw x y z = (x `sappend` y) `sappend` z == x `sappend` (y `sappend` z)

instance Semigroup Int where
  sappend = (*)

sgTest1 :: IO ()
sgTest1 = let sgLaw' = sgLaw :: Int -> Int -> Int -> Bool
          in quickCheck sgLaw'

instance Semigroup [a] where
  sappend = (++)

sgTest2 :: IO ()
sgTest2 = let sgLaw' = sgLaw :: [Float] -> [Float] -> [Float] -> Bool
          in quickCheck sgLaw'
