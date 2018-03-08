import Effect.Default
import Effect.Logging.Default
import Effect.Logging.Level
import Effects

k : Eff () [LOG]
k = do
  info "konoko"
  info "sugar"
  info "cover"

--Handler Logging Identity where
--  handle res (SetLvl newLvl) k = do
--    the 
--    the (LogLevel n) newLvl

main : IO ()
main = run k
