f : Nat -> String
f x = case x of
           S n  => "ya"
           Z    => "hi"

main : IO ()
main = putStrLn $ f 10
-- {output}
-- ya
