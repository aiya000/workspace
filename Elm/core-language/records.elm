import Html exposing (Html, div, text)

nico : { x : number, y : number25252 }
nico = { x = 74, y = 17 }

main : Html a
main =
  let mine = nico.x
      nozomi = { nico | x = 90 }
  in div [] [ div [] ["nico: " ++ toString mine |> text]
            , div [] ["nozomi: " ++ toString nozomi.x |> text]
            ]
