
fizzBuzz :: [Int] -> [(Int,String)]
fizzBuzz xs = fmap shout xs
  where shout x
          | f && b = (x, "FizzBuzz")
          | f      = (x, "Fizz")
          | b      = (x, "Buzz")
          | otherwise  = (x, "")
          where f = x `mod` 3 == 0
                b = x `mod` 5 == 0

main = print $ fizzBuzz [1..30]
