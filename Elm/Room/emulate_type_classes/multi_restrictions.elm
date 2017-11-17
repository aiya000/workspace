import EmClass.Eq exposing (..)
import EmClass.Num exposing (..)
import Html exposing (Html, div, text)

memsq : (EqD a, NumD a) -> List a -> a -> Bool
memsq (eqDa, numDa) xs y = member eqDa xs (square numDa y)


main : Html a
main = div []
  [ div [] [memsq (eqDInt, numDInt) [1, 3, 5, 7, 9] 3 |> toString |> text]
  ]
