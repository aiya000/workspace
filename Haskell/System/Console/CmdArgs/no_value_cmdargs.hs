{-# LANGUAGE DeriveDataTypeable #-}
import System.Console.CmdArgs

data Options = Options { flag :: Bool } deriving (Show, Data, Typeable)
options = Options { flag = False }

main :: IO ()
main = cmdArgs options >>= print
