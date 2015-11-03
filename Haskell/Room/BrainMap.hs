import Control.Monad.Identity
import Debug.Trace

-- Data -- {{{

data BFOperator = Plus
                | Minus
                | Shift
                | Unshift
--                | Input
--                | Output
                | LoopStart
                | LoopEnd
                --deriving Eq
                deriving (Eq, Show)

type BFOpStack = [BFOperator]
type BFMemory  = [Int]
type BFPointer = Int

data BFMachine = BFMachine { stack   :: BFOpStack
                           , memory  :: BFMemory
                           , pointer :: BFPointer }

-- }}}

main :: IO ()
main = do
  let result = Identity (createMachine bfOpStack) >>= \a ->
               consumeOne (traceShow a a) >>= \b ->
               consumeOne (traceShow b b) >>= \c ->
               consumeOne (traceShow c c) >>= \d ->
               consumeOne (traceShow d d) >>= \e ->
               consumeOne (traceShow e e) >>= \f ->
               consumeOne (traceShow f f)
  print $ runIdentity result

bfExpr :: [Char]
--bfExpr = "+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-."
--bfExpr = "+++++++++[>++++++++>+++++++++++>+++++<<<-]>>++++++++++++>-"
bfExpr = "+>+>>+"
bfOpStack :: BFOpStack
bfOpStack = map toBFOperator bfExpr

-- brain f*ck -- {{{

toBFOperator :: Char -> BFOperator
toBFOperator '+' = Plus
toBFOperator '-' = Minus
toBFOperator '>' = Shift
toBFOperator '<' = Unshift
--toBFOperator ',' = Input
--toBFOperator '.' = Output
toBFOperator '[' = LoopStart
toBFOperator ']' = LoopEnd
toBFOperator _   = undefined

-- }}}
-- BFMachine -- {{{

incrementValue :: BFMachine -> BFMachine
incrementValue machine =
  let mem   = memory machine
      x     = mem !! pointer
      x'    = x + 1
      under = take (pointer - 1) mem
      over  = drop pointer mem
      mem'  = under ++ [x'] ++ over
  in BFMachine { stack   = stack machine
               , memory  = mem'
               , pointer = pointer machine }

decrementValue :: BFMachine -> BFMachine
decrementValue (stack, mem, pointer) =
  let x     = mem !! pointer
      x'    = x - 1
      under = take (pointer - 1) mem
      over  = drop pointer mem
      mem'  = under ++ [x'] ++ over
  in (stack, mem', pointer)

-- }}}

createMachine :: BFOpStack -> BFMachine
createMachine stack = (stack, replicate 100 0, 0)

consumeOne :: BFMachine -> Identity BFMachine
consumeOne machine@((Plus:ops), _, pt) =
   let (_, mem', _) = incrementValue machine
   in return (ops, mem', pt)

consumeOne machine@((Minus:ops), _, pt) =
   let (_, mem', _) = decrementValue machine
   in return (ops, mem', pt)

consumeOne ((Shift:ops), mem, pt)   = return (ops, mem, pt + 1)
consumeOne ((Unshift:ops), mem, pt) = return (ops, mem, pt - 1)

--consumeOne ((LoopStart:ops), mem, pt) = state $ \machine ->
--consumeOne ((LoopEnd:ops), mem, pt)   = state $ \machine ->
consumeOne _ = undefined
