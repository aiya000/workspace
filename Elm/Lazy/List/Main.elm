module Main exposing (..)

import Html exposing (Html, div, text)
import Lazy.List exposing (LazyList, cons, empty, toList)


xs : LazyList Int
xs =
    cons 10 (cons 20 empty)


main : Html a
main =
    div []
        [ text <| toString <| toList xs
        ]
