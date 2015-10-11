import Control.Monad.State
import Debug.Trace (trace)

type Message = String

rabitHouse :: State Message Message
rabitHouse = state $ \s -> ("", "")

chino :: Message -> State Message Message
chino x = state $ \s -> (x ++ "ごち", "")

rize :: Message -> State Message Message
rize x = state $ \s -> (x ++ "うさ", "")

cocoa :: Message -> State Message Message
cocoa x = state $ \s -> (x ++ "うどん！", "")

syaro :: Message -> State Message Message
syaro x = state $ \s -> (x ++ "ワールド！", "")

chiya :: Message -> State Message Message
chiya x = state $ \s -> (x ++ "祝福の風", "")

main :: IO ()
main = putStrLn $ evalState
  (rabitHouse >>= chino >>= rize >>= cocoa >>= syaro >>= chiya)
  ""
