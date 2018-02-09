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
