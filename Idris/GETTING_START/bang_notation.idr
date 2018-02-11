infixr 10 ?+?
(?+?) : Maybe Int -> Maybe Int -> Maybe Int
x ?+? y = pure $ !x + !y

infixr 10 !+!
(!+!) : IO Int -> IO Int -> IO Int
x !+! y = pure $ !x + !y

main : IO ()
main = do
  printLn $ Just 10 ?+? Just 20
  pure 10 !+! pure 20 >>= printLn
-- {output}
-- Just 30
-- 30
