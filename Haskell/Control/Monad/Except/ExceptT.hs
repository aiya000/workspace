import Control.Monad.Except

type InputMonad = ExceptT String IO

main :: IO ()
main = do
  input <- runExceptT getLineNotEmpty
  reportResult input

getLineNotEmpty :: InputMonad String
getLineNotEmpty = do
  x <- liftIO getLine
  if null x
     then throwError "null"
     else return x

reportResult :: Either String String -> IO ()
reportResult (Right r) = putStrLn $ "input: " ++ r
reportResult (Left  l) = putStrLn $ "bad input (" ++ l ++ ")"
