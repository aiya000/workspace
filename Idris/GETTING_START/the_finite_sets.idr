-- Idris is a strictly evaluated language,
-- but Idris has so strong pieces of equipment for the halting problem
-- e.g. `Vect` and `Fin` (these are defined in the standard library, Data.Fin and Data.Vect)

data Vect : Nat -> Type -> Type where
  Nil : Vect Z a
  (::) : a -> Vect n a -> Vect (S n) a

data Fin : Nat -> Type where
  FZ : Fin Z
  FS : Fin n -> Fin (S n)

drop' : Fin n -> Vect (n + m) a -> Vect m a
drop' FZ xs = xs
drop' (FS n) (_ :: xs) = drop' n xs

length' : Vect n a -> Nat
length' {n = x} _ = x

main : IO ()
main = do
  printLn . length' $ drop' (FS (FS FZ)) (1 :: 2 :: 3 :: 4 :: 5 :: Nil)
-- {output}
-- 3
