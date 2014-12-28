
type Code = String
type SymCode = [Code]
getSymmetric :: Code -> SymCode
getSymmetric c =
  let first  = take (length c `div` 2) c
      harf (_:l) = if (length l) == (length c `div` 2)
                then l
                else harf l
      second = reverse $ harf c
  in  [first, second]


code :: Code
code = "?x?xxoo?o?xxo?"
xcost = 2
ocost = 3
defChar | xcost <= ocost  = 'x'
        | xcost >  ocost  = 'o'

replaceHoge :: SymCode -> SymCode
replaceHoge [] = []
replaceHoge ct =
  let fChar = head (ct!!0)
      sChar = head (ct!!1)
  in  if fChar == '?' then
        if sChar == '?'
          then [defChar:(replaceHoge $ tail ct)] ++ [defChar:(replaceHoge $ tail ct)]
          else [sChar:(replaceHoge $ tail ct)] ++ [sChar:(replaceHoge $ tail ct)]
      else
        if sChar == '?'
          then [fChar:(replaceHoge $ tail ct)] ++ [fChar:(replaceHoge $ tail ct)]
          else [sChar:(replaceHoge $ tail ct)] ++ [sChar:(replaceHoge $ tail ct)]

main = do
  let symCode = getSymmetric code
      fst = symCode !! 0
      snd = symCode !! 1
  putStr   "F: "
  putStrLn fst
  putStr   "S: "
  putStrLn snd
