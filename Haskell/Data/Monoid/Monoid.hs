import Test.QuickCheck

mnLawAp :: (Monoid a, Eq a) => a -> a -> a -> Bool
mnLawAp x y z = (x `mappend` y) `mappend` z == x `mappend` (y `mappend` z)

mnLawEm :: (Monoid a, Eq a) => a -> Bool
mnLawEm x =
  let left  = mempty `mappend` x
      right = x `mappend` mempty
  in left == right && right == x

instance Monoid Int where
  mappend = (*)
  mempty  = 1

mnTestAp1 :: IO ()
mnTestAp1 = let mnLawAp' = mnLawAp :: Int -> Int -> Int -> Bool
            in quickCheck mnLawAp'

mnTestEm1 :: IO ()
mnTestEm1 = let mnLawEm' = mnLawEm :: Int -> Bool
            in quickCheck mnLawEm'
