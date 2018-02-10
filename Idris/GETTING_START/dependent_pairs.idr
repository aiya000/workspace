import Data.Vect

x : (n : Nat ** Vect n Int)
x = (2 ** [10, 20])

y : (n : Nat ** Vect n Int)
y = (_ ** [10, 20])

main : IO ()
main = do
  printLn x
  printLn y
