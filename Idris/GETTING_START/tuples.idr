x : Pair Int Char
x = MkPair 10 'a'

-- This is a syntax sugar to 'Pair' and 'MkPair'
y : (Int, Char)
y = (20, 'b')

main : IO ()
main = do
  printLn x
  printLn $ fst x
  printLn y
  printLn $ snd y
-- {output}
-- (10, 'a')
-- 10
-- (20, 'b')
-- 'b'
