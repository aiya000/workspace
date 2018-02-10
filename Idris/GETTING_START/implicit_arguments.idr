import Data.Vect

id' : a -> a
id' x = x

idVect : Vect n a -> Vect n a
idVect = id'

main : IO ()
main = do
  printLn $ id' {a=Int} 10
  --printLn $ id' {b=Int} 10 -- cannot
  let xs = [1,2,3]
  printLn $ idVect {n=3} {a=Int} xs
  printLn $ length' xs
where
  -- implicit arguments can be used in patterns
  length' : Vect n a -> Nat
  length' {n = x} _ = x
