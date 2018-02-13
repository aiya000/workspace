head'' : (xs : List a) -> {auto p : isCons xs = True} -> a
head'' (x :: _) = x

main : IO ()
main = printLn $ head'' ["good"]
