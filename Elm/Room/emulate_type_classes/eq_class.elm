module EmClass.Eq
  exposing
  ( EqD (..)
  , eq
  , eqDInt
  , eqDList
  )

import Html exposing (Html, div, text)
import List

{-| 
class Eq a where
  eq :: a -> a -> Bool
-}
type EqD a = EqDict
  { eq : a -> a -> Bool
  }

{-|
eq :: Eq a => a -> a -> Bool
-}
eq : EqD a -> a -> a -> Bool
eq (EqDict { eq }) = eq


{-| 
instance Eq Int where
  eq = (==)
-}
eqDInt : EqD Int
eqDInt = EqDict
  { eq = (==)
  }


{-|
  深さnのインスタンス（n >= 2）
  （undecidable instance）
-}
eqDList : EqD a -> EqD (List a)
eqDList eqDa =
  let
    eqList : EqD a -> List a -> List a -> Bool
    eqList eqDa xs ys = List.map2 (eq eqDa) xs ys |> List.all identity
  in EqDict
      { eq = eqList eqDa
      }


eqMain : Html a
eqMain = div []
  [ div [] [eq eqDInt 1 1 |> toString |> text]
  , div [] [eq (eqDList eqDInt) [1, 1] [1, 2] |> toString |> text]
  , div [] [eq (eqDList (eqDList eqDInt)) [[10], [1, 2]] [[10], [1, 2]] |> toString |> text ]
  ]


main : Html a
main = div []
  [ eqMain
  ]
