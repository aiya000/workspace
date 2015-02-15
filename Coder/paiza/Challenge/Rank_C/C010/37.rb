# Sound Area => (a,b,R) :: (Point x, Point y, SoundRange)
a, b, r = STDIN.gets.split(" ").map{|x| x.to_i }

# Trees num
n = STDIN.gets.to_i

# xys :: [(x,y)]
xys = (1..n).map{|_| STDIN.gets.split(" ").map{|x| x.to_i } }


xys.each do |xy|
  x, y = xy
  is_silent = (x - a) ** 2 + (y - b) ** 2 >= r ** 2

  if is_silent then
    puts "silent"
  else
    puts "noisy"
  end
end
