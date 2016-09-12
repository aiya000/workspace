import Control.Monad.State

data Player = PlayerA [Card] | PlayerB [Card] | PlayerC [Card]
            deriving (Show)

data Card = CardA | CardB | CardC
          deriving (Show)

toCard :: Char -> Maybe Card
toCard 'a' = Just CardA
toCard 'b' = Just CardB
toCard 'c' = Just CardC
toCard _   = Nothing

unsafeRemoveMaybe :: Maybe Card -> Card
unsafeRemoveMaybe (Just x) = x
unsafeRemoveMaybe Nothing  = error "card muri"

data Winner = WinA | WinB | WinC
instance Show Winner where
  show WinA = "A"
  show WinB = "B"
  show WinC = "C"

type Players   = (Player, Player, Player)
type GameStage = State Players Winner


main :: IO ()
main = do
  sa <- PlayerA . map (unsafeRemoveMaybe . toCard) <$> getLine
  sb <- PlayerB . map (unsafeRemoveMaybe . toCard) <$> getLine
  sc <- PlayerC . map (unsafeRemoveMaybe . toCard) <$> getLine
  print $ evalState (pay sa) (sa, sb, sc)

pay :: Player -> GameStage
pay (PlayerA []) = return WinA
pay (PlayerB []) = return WinB
pay (PlayerC []) = return WinC
pay (PlayerA (x:xs)) = do
  (_, bs, cs) <- get
  put (PlayerA xs, bs, cs)
  case x of
    CardA -> pay $ PlayerA xs
    CardB -> pay $ bs
    CardC -> pay $ cs
pay (PlayerB (x:xs)) = do
  (as, _, cs) <- get
  put (as, PlayerB xs, cs)
  case x of
    CardA -> pay $ as
    CardB -> pay $ PlayerB xs
    CardC -> pay $ cs
pay (PlayerC (x:xs)) = do
  (as, bs, _) <- get
  put (as, bs, PlayerC xs)
  case x of
    CardA -> pay $ as
    CardB -> pay $ bs
    CardC -> pay $ PlayerC xs
