data Person = Me

||| A type synonym
Human : Type
Human = Person

Show Human where
  show Me = "Me"

main : IO ()
main = printLn $ the Person Me
