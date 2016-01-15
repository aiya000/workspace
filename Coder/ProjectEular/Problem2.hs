-- Se http://d.hatena.ne.jp/takatoh/20060417/1145268988
fibonacci :: Integral a => [a]
fibonacci = 1 : 1 : zipWith (+) fibonacci (tail fibonacci)

main = do
  print $ sum . take 4000000 $ fibonacci
