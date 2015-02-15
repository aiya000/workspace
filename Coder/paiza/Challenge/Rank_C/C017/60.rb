a, b = gets.split(" ").map{|x| x.to_i }

n = gets.to_i

ts = (1..n).map{ gets.split(" ").map{|x| x.to_i } }
bs = ts.map{|t| x, y = t; a > x || (a == x && b < y) }


bs.each do |b|
  if b
    puts "High"
  else
    puts "Low"
  end
end
