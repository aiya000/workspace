import EmClass.Eq exposing (..)
import EmClass.Num exposing (..)
import Html exposing (Html, div, text)

{-
  元論文では例えば以下のような関数
      memsq :: (Eq a, Num a) => [a] -> a -> Bool
  の制約(Eq a, Num a)を今までのルールに載せるには
  「Eq aもしくはNum aのクラス宣言で、どちらかをどちらかのサブクラスにするといい」
  と書いてあるっぽい（と思う）……
  つまるところプリプロセス時などでEq型クラスを
      class Num a => Eq a where ...
      memsq :: Eq a => [a] -> a -> Bool
  と改変するかもしくは
      class Eq a => Num a where ...
      memsq :: Num a => [a] -> a -> Bool
  とするとよいという解釈できるっぽい。
  ……のです…が、
  このアプローチではプリプロセス時などはないので、
  単純に型クラスインスタンス値の実体の組を受け取ればいけそうです。

  強いて言えば例えば後述のmemsqの定義に
      memsq (numDInt, eqDInt)
  という適用をすると型のミスマッチになるところが問題ですが問題ないはずです。
  （型制約の部分に順序が発生する）

  （というかそもそもmemsqとは別にf :: Num a -> a -> aのようなEq aを要求しない関数があったときにも
  ワドラーのアプローチだとfにもEq aを要求してしまうという問題がある気がする。
  なんか僕読み違えてるのかな？）
-}

memsq : (EqD a, NumD a) -> List a -> a -> Bool
memsq (eqDa, numDa) xs y = member eqDa xs (square numDa y)


main : Html a
main = div []
  [ div [] [memsq (eqDInt, numDInt) [1, 3, 5, 7, 9] 3 |> toString |> text]
  ]
