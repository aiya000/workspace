import System.Random.Shuffle

-- See hackage 'random-shuffle'
--- shuffle, shuffle', shuffleM


main :: IO ()
main = do
  xs <- shuffleM [1..10]
  print xs
