{-# LANGUAGE DeriveDataTypeable #-}
import System.Console.CmdArgs

data Hello = Hello { hello :: String } deriving (Show, Data, Typeable)

hi = Hello { hello = def &= help "World argument" &= opt "world" }
        &= summary "Hello, CmdArgs !!"

main = cmdArgs hi >>= print
