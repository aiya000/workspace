import Html exposing (Html, div, text)

type CoerceD a b = CoerceDict
  { coerce : a -> b
  }

coerce : CoerceD a b -> a -> b
coerce (CoerceDict {coerce}) = coerce

coerceDIntFloat : CoerceD Int Float
coerceDIntFloat = CoerceDict
  { coerce = toFloat
  }

main : Html a
main = div []
  [ div [] [coerce coerceDIntFloat 10 |> toString |> text]
  ]
