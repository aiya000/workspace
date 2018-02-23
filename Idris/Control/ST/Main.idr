import Control.ST

||| basic
context : (initial : Int) -> STrans m Int [] (const [])
context init = do
  var <- new init
  increment var
  x <- read var
  delete var
  pure x
where
  increment : (x : Var) -> STrans m () [x ::: State Int] (const [x ::: State Int])
  increment var = do
    x <- read var
    write var $ x + 1

main : IO ()
main = printLn . runPure $ context 10
