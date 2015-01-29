xs = [1, 2, 3, "1", "2", "3", [1], [2], [3]]
xs[0]    = 10
xs[-1]   = [[20]]
xs[3..4] = ["10", "20"]
xs[3..3] = ["a", "b", "c"]

p xs
p xs[0..2]
p xs[0...2]
p xs[3, 7]

p xs.size
p xs.reverse

xs << 10.0 << 20.0
p xs

zs = [["hoge", 10], ["ahoge", 20]].to_h
p zs
