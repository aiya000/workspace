f : (x : Bool) -> if x then Int else Char
f True  = 10
f False = 'a'

main : IO ()
main = do
  printLn $ f True
  printLn $ f False
-- {output}
-- 10
-- 'a'
