x : ()
x = const () Me
  where
    data Mine = Me

main : IO ()
main = do
  printLn x
  -- vvv error! vvv
  --let z = Me
  --pure ()

context : Monad m => m ()
context = do
  pure' ()
where -- The indentation level cannot be +1
  pure' : Monad m => a -> m a
  pure' = pure
