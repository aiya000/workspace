{-# LANGUAGE DeriveDataTypeable #-}
import System.Console.CmdArgs

data Options = Options { triname :: String
                       , width   :: Float
                       , height  :: Float
                       } deriving (Show, Data, Typeable)

options = Options { triname = "no name" &= name "name" &= explicit
                  , width   = 0
                  , height  = 0
                  }
            &= summary "Triangle area size calculation"
            &= program "triangle"

main = do
  opt <- cmdArgs options
  let size = width opt * height opt / 2.0
  putStrLn $ "Triangle '" ++ triname opt ++ "' size is " ++ show size


-- <run example>
-- $ runghc basic_cmdargs.hs --name=taro --width=200 --height=300
-- $ runghc basic_cmdargs.hs --name taro --width 200 --height 300
