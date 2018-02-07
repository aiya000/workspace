module Main

x : Int
x = 10

s : String
s = "sugar"

c : Char
c = 'k'

b : Bool
b = True

n : Nat
n = S Z

m : Nat
m = 1

y : Int
y = if b then 20 else -1

main : IO ()
main = do
  printLn x
  printLn s
  printLn c
  printLn b
  printLn n
  printLn m
  printLn y
