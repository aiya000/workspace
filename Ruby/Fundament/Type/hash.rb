xs = { "hoge"  => 10, "ahoge" => 20 };

p xs
p xs["hoge"]

ys = { :hoge => 30, :ahoge => 40 }
p ys
p ys[:ahoge]

p xs.size
p xs.keys
p ys.keys
p xs.values
p xs.has_key?("ahoge")
p ys.has_key?(:hoge)
p xs.to_a
p ys.to_a
