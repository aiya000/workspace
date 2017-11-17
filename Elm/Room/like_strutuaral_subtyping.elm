import Html exposing (Html, div, text)

f : {a | x : number} -> number
f x = x.x

x : {x : number, y : String}
x = { x = 10
    , y = "sugar"
    }

main : Html a
main = div []
  [ div [] [f x |> toString |> text]
  ]
