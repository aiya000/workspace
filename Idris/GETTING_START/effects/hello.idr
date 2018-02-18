import Effects
import Effect.StdIO

hello : Eff () [STDIO]
hello = putStrLn "sugar"

main : IO ()
main = run hello
