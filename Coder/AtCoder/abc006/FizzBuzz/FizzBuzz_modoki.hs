-- http://abc006.contest.atcoder.jp/tasks/abc006_1

nx = [1..30]

fizzBuzzMod xs = mapM_ putter $ fmap (\x -> x `mod` 3 == 0 || '3' `elem` (show x)) xs
  where putter x = if x then putStrLn "Yes" else putStrLn "No"

main = fizzBuzzMod nx
