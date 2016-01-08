FIRST    = "first"
ADJACENT = "adjacent"
SECOND   = "second"
THIRD    = "third"
BLANK    = "blank"

def f(x, b)
  if x == b then
    FIRST
  elsif x == b - 1 || x == b + 1 then
    ADJACENT
  elsif x.to_s.slice(2, x.to_s.length) == b.to_s.slice(2, b.to_s.length) then
    SECOND
  elsif x.to_s.slice(3, x.to_s.length) == b.to_s.slice(3, b.to_s.length) then
    THIRD
  else
    BLANK
  end
end

b = STDIN.gets.to_i
n = STDIN.gets.to_i
n.times
  .map{ STDIN.gets.to_i }
  .map{|x| f(x, b) }
  .each{|x| puts x }
