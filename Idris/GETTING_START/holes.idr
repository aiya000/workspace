-- This code throws the runtime error like below
------------------------------------------------
--    WARNING: There are incomplete holes:
--     [Main.x]
--
--    Evaluation of any of these will crash at run time.
------------------------------------------------
main : IO ()
main = putStrLn ?x
-- In REPL, `:t x` is answered as `x : String`
