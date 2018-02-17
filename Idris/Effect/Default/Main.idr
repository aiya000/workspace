import Effect.Default

main : IO ()
main = do
  printLn $ the Int default
  printLn $ the Char default
  printLn $ the Bool default
  printLn $ the String default
  printLn $ the (List String) default
-- {output}
-- 0
-- '\NUL'
-- False
-- ""
-- []
