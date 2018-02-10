import Debug.Error

%language ElabReflection

%hide ifThenElse

-- These are same

ifThenElse : Bool -> Lazy a -> Lazy a -> a
ifThenElse True  x _ = x
ifThenElse False _ y = y

ifThenElse' : Bool -> Lazy a -> Lazy a -> a
ifThenElse' True  (Delay x) _ = x
ifThenElse' False _ (Delay y) = y

ifThenElse'' : Bool -> Lazy a -> Lazy a -> a
ifThenElse'' True  x _ = Force x
ifThenElse'' False _ y = Force y

ifThenElseBad : Bool -> a -> a -> a
ifThenElseBad True  x _ = x
ifThenElseBad False _ y = y

main : IO ()
main = do
  putStrLn $ ifThenElse   False (error "ya") "good"
  putStrLn $ ifThenElse'  False (error "ya") "good"
  putStrLn $ ifThenElse'' False (error "ya") "good"
  putStrLn $ ifThenElseBad False (error "ya") "good <- !?!?"
-- {output}
-- good
-- good
-- good
-- good <- !?!?

-- TODO:
-- NOTE:
-- In my opinion, it was ignited.
-- Why Idris can avoid to evaluate `error "ya"` in ifThenElse !?
