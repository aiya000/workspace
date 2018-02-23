import Control.ST

tell : Semigroup a => (x : Var) -> a -> STrans m () [x ::: State a] (const [x ::: State a])
tell var x = update var (<+> x)

-- Writer monad like
context : (x : Var) -> STrans m () [x ::: State (List String)] (const [x ::: State (List String)])
context var = do
  tell var ["Look"]
  tell var ["at"]
  tell var ["me"]

main : IO ()
main = printLn . runPure $ do
  var <- new $ the (List String) []
  x <- context var
  delete var
  pure x
