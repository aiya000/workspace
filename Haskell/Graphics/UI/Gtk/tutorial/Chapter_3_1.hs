import Graphics.UI.Gtk

main :: IO ()
main = do
  initGUI
  window <- windowNew
  vbox   <- vBoxNew True 10
  label  <- labelNewWithMnemonic "Contained"
  button <- buttonNewWithLabel   "foobar"
  boxPackStart vbox label  PackGrow 0
  boxPackStart vbox button PackGrow 0
  set window
    [ windowDefaultWidth   := 200
    , windowDefaultHeight  := 200
    , containerBorderWidth := 10
    , containerChild       := vbox
    ]
  onDestroy window mainQuit
  widgetShowAll window
  mainGUI
