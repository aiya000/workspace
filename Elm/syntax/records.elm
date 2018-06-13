import Html exposing (Html, div, text)

nico : { x : number, y : number25252 }
nico = { x = 74, y = 17 }

main : Html a
main =
  let wall = nico.x
      age  = .y nico
      nozomi = { nico | x = 90 }
  in div [] [ div [] ["nico: { x = " ++ toString wall ++
                            ", y = " ++ toString age ++
                            " }" |> text]
            , div [] ["nozomi: " ++ toString nozomi |> text]
            ]
