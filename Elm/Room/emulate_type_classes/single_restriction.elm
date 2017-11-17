module EmClass.Num
  exposing
  ( NumD (..)
  , add
  , mul
  , neg
  , numDInt
  , numDFloat
  , numDPair
  , square
  , squares
  )

import Html exposing (Html, div, text)

{-| Num型クラスの定義（ここではNumD型クラス） -}
type NumD a = NumDict
  { add : a -> a -> a
  , mul : a -> a -> a
  , neg : a -> a
  }

add : NumD a -> (a -> a -> a)
add (NumDict {add}) = add

mul : NumD a -> (a -> a -> a)
mul (NumDict {mul}) = mul

neg : NumD a -> (a -> a)
neg (NumDict {neg}) = neg


{- 各Numインスタンスの定義 -}

{-| Intインスタンス -}
numDInt : NumD Int
numDInt = NumDict
  { add = (+)
  , mul = (*)
  , neg = negate
  }

{-| Floatインスタンス -}
numDFloat : NumD Float
numDFloat = NumDict
  { add = (+)
  , mul = (*)
  , neg = negate
  }


{-| 汎用的なNum関数の例 -}
square : NumD a -> a -> a
square numDa x = mul numDa x x

squares : (NumD a, NumD b, NumD c) -> (a, b, c) -> (a, b, c)
squares (numDa, numDb, numDc) (x, y, z) = (square numDa x, square numDb y, square numDc z)


numMain : Html a
numMain = div []
  [ div [] [text "## 各Numインスタンスの振る舞い"]
  , div [] [add numDInt 1 2 |> toString |> text]
  , div [] [neg numDFloat 1 |> toString |> text]
  , div [] [square numDInt 2 |> toString |> text]
  , div [] [square numDFloat 3.0 |> toString |> text]
  , div [] [squares (numDInt, numDInt, numDFloat) (2, 3, 3) |> toString |> text]
  , div [] [ text "コンパイルエラー！（1 and 2.0 has the different types）: "
           , text "`add numDInt 1 2.0 |> toString |> text`"
           ]
  ]


{-| undecidable instanceの定義の例 -}
numDPair : (NumD a, NumD b) -> NumD (a, b)
numDPair numDab =
  let
    addPair : (NumD a, NumD b) -> (a, b) -> (a, b) -> (a, b)
    addPair (numDa, numDb) (x1, y1) (x2, y2) = (add numDa x1 x2, add numDb y1 y2)
    mulPair : (NumD a, NumD b) -> (a, b) -> (a, b) -> (a, b)
    mulPair (numDa, numDb) (x1, y1) (x2, y2) = (mul numDa x1 x2, mul numDb y1 y2)
    negPair : (NumD a, NumD b) -> (a, b) -> (a, b)
    negPair (numDa, numDb) (x, y) = (neg numDa x, neg numDb y)
  in NumDict
      { add = addPair numDab
      , mul = mulPair numDab
      , neg = negPair numDab
      }

depth2InstancesMain : Html a
depth2InstancesMain = div []
  [ div [] [add (numDPair (numDInt, numDFloat)) (1, 2.1) (3, 4.6) |> toString |> text]
  ]


main : Html a
main = div []
  [ numMain
  , depth2InstancesMain
  ]
