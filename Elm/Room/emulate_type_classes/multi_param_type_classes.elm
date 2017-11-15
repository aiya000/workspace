import Html exposing (Html, div, text)

{-
  元論文の（本編の）終わりに出てくる、
  複数の引数を持つ型クラス（MultiParamTypeClasses）
  の例であるCoerce型クラス
  （aからbへの変換ができること（= bがaの親であること）、を表す型クラス）
  はmulti param type classが実装できることを示すために重要ということで、
  これで締めとして、やっていきましょう :muscle:
-}

type CoerceD a b = CoerceDict
  { coerce : a -> b
  }

coerce : CoerceD a b -> a -> b
coerce (CoerceDict {coerce}) = coerce

coerceDIntFloat : CoerceD Int Float
coerceDIntFloat = CoerceDict
  { coerce = toFloat
  }

{-
  引数が3つ以上でも、同じく実装できることでしょう！
  （締め）
-}


{- 終わりに
  本記事のタイトルに付けた 'without implicit caller'
  の意ですが、本アプローチではご覧の通り
  型クラスインスタンス値（例えばeqDInt）を
  関数呼び出し時に省略することができません、
  ということを表しています（今更）。
  （これをScalaは 'implicit' でうまいこと解決していると思います）

  しかしこれは逆に言うと本アプローチによる型クラスの提供が、
  不変性の前提がある中でも動く、ある種の（値の世界での）
  Dependency Injectionパターンとして動く示していると考えます。
  （実用上は褒められたアプローチではないけどね！）

  また、今回は元論文の表現に準拠し、型クラスになる型の命名に
  suffix 'D'を付けていましたが、必要ない場合には付けなくてもいいかと思います。
  またその値構築子も型名に合わせてもいいでしょう ;P
-}

main : Html a
main = div []
  [ div [] [coerce coerceDIntFloat 10 |> toString |> text]
  ]
