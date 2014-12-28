-- http://abc006.contest.atcoder.jp/tasks/abc006_2

tribonacci 0 = 0
tribonacci 1 = 0
tribonacci 2 = 1
tribonacci n = tribonacci (n-3) + tribonacci (n-2) + tribonacci (n-1)


answer a = (tribonacci a) `mod` 10007
--main = print $ tribonacci 3
--main = print $ answer 100000
main = do
  num <- getLine
  print $ answer (read num :: Int)
