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

{-|
  How to make and use type classes without implicit caller in Elm
  - 侵略者 -
-}

import Html exposing (Html, div, text)

{- 表現は元の論文に準拠しつつ、かつ可能な場合は現代的な表現を用います -}

{-| Num型クラスの宣言（ここではNumD型クラス） -}
type NumD a = NumDict
  { add : (a -> a -> a)
  , mul : (a -> a -> a)
  , neg : (a -> a)
  }

{- NOTE:
  ここで例えば
  type NumD a = NumDict
    { add : (a -> a -> a)
    , mul : (a -> a -> a)
    , neg : (a -> a)
    }
  とかすると、後述の
  (Num a, Num b) => Num (a, b)
  インスタンスで.addが不能になるので、一般化されたadd/mul/negを作る。

  e.g.
  .add numDInt 1 2 -- OK
  .add (numDPair (numDInt, numDInt)) (1, 2) (3, 4) -- Compile Error !
  add (numDPair (numDInt, numDInt)) (1, 2) (3, 4) -- OK
-}

{- Num型クラスの定義 -}

{-| (+)の代わり -}
add : NumD a -> (a -> a -> a)
add (NumDict { add }) = add
{-| (*)の代わり -}
mul : NumD a -> (a -> a -> a)
mul (NumDict { mul }) = mul
{-| negateの代わり -}
neg : NumD a -> (a -> a)
neg (NumDict { neg }) = neg


{- 各Numインスタンスの定義 -}

{-| IntのNumインスタンスの定義 -}
numDInt : NumD Int
numDInt = NumDict
  { add = (+)
  , mul = (*)
  , neg = negate
  }

{-| FloatのNumインスタンスの定義 -}
numDFloat : NumD Float
numDFloat = NumDict
  { add = (+)
  , mul = (*)
  , neg = negate
  }


{-|
  汎用的なNum関数の例
  square :: Num a -> a -> a
  square x = x * x
-}
square : NumD a -> a -> a
square numDa x = mul numDa x x

{-| 
  深さが2の汎用的なNum関数の例
  squares :: (Num a, Num b, Num c) => (a, b, c) -> (a, b, c)
  squares (x, y, z) = (square x, square y, square z)
-}
squares : (NumD a, NumD b, NumD c) -> (a, b, c) -> (a, b, c)
squares (numDa, numDb, numDc) (x, y, z) = (square numDa x, square numDb y, square numDc z)


{-| ここまでのおさらい -}
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


{-|
  深さ2のインスタンス定義
  instance (Num a, Num b) => Num (a, b) where
    add (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
    mul ...
-}
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
  [ div [] [add (numDPair (numDInt, numDFloat)) (1, 2.0) (3, 4.0) |> toString |> text]
  ]


main : Html a
main = div []
  [ numMain
  , depth2InstancesMain
  ]
