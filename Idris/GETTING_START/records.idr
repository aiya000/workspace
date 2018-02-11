record Mine a where
  constructor My
  name  : String
  thing : a

Show a => Show (Mine a) where
  show (My name thing) = "My " ++ show name ++ ": " ++ show thing

main : IO ()
main = do
  let sense = My "cover" (My "sugar" "")
  printLn sense
  -- update record
  printLn $ record {name = "sield"} sense
  printLn $ record {name $= ("sield " ++)} sense
  printLn $ record {thing->thing = "power"} sense
  -- but the type cannot be changed
  -- printLn $ record {thing->thing = ()} sense
  -- get record
  printLn $ record {name} sense
  printLn $ record {thing->name} sense
-- {output}
-- My "cover": My "sugar": ""
-- My "sield": My "sugar": ""
-- My "sield cover": My "sugar": ""
-- My "cover": My "sugar": "power"
-- "cover"
-- "sugar"
