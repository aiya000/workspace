import Control.Monad.Identity
import Effect.Default
import Effect.State
import Effects

-- A state for a STATE effect
record AState where
  constructor MkAState
  core : Int

Show AState where
  show (MkAState x) = "MkAState " ++ show x

-- An instance of a state is required if runPure's default `Env` is used
Default AState where
  default = MkAState default

-- A context
k : Eff AState [STATE AState]
k = do
  (MkAState core) <- get
  put (MkAState $ core + 1)
  get

k' : Eff AState [STATE AState]
k' = do
  update $ record {core $= (+1)}
  get

runPureEnv : (env : Env Basics.id xs) -> (prog : EffM Basics.id a xs xs') -> (x : a ** Env Basics.id (xs' x))
runPureEnv env prog = eff env prog (\r, env => (r ** env))

main : IO ()
main = do
  printLn $ runPure k
  printLn $ runPure k'
  let (_ ** [s]) = runPureEnv [default] k
  printLn s
  -- use the non default `Env` (`default : AState`)
  printLn $ runPureInit [MkAState 10] k
