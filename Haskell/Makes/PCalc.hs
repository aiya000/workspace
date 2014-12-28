
expr = "12+34*5-*" -- 1+2-5*3*4 = 63

nFilter = filter ('0'<=) . filter (<='9')
oFilter (x:xs)
  | x == '+'  = x : oFilter xs
  | x == '-'  = x : oFilter xs
  | x == '*'  = x : oFilter xs
  | x == '/'  = x : oFilter xs
  | xs== []  = []
  | otherwise = oFilter xs
