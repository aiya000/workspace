import Html exposing (Html, div, text)

{- 表現は元の論文に準拠しつつ、かつ可能な場合は現代的な表現を用います -}

{-| Num型クラスの宣言 -}
type NumD a = NumDict (a -> a -> a)
                      (a -> a -> a)
                      (a -> a)

{-| Num型クラスの定義 -}
add : NumD a -> (a -> a -> a)
add (NumDict f _ _) = f
mul : NumD a -> (a -> a -> a)
mul (NumDict _ f _) = f
neg : NumD a -> (a -> a)
neg (NumDict _ _ f) = f


{-| IntのNumインスタンスの定義 -}
numDInt : NumD Int
numDInt = NumDict (+) (*) negate

{-| FloatのNumインスタンスの定義 -}
numDFloat : NumD Float
numDFloat = NumDict (+) (*) negate


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


main : Html a
main = div []
  [ div [] [text "各Numインスタンスの振る舞い"]
  , div [] [add numDInt 1 2 |> toString |> text]
  , div [] [neg numDFloat 1 |> toString |> text]
  , div [] [square numDInt 2 |> toString |> text]
  , div [] [square numDFloat 3.0 |> toString |> text]
  , div [] [squares (numDInt, numDInt, numDFloat) (2, 3, 3) |> toString |> text]
  , div [] [ text "コンパイルエラー！（1 and 2.0 has the different types）: "
           , text "`add numDInt 1 2.0 |> toString |> text`"
           ]
  ]
