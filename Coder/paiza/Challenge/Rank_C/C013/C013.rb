n = gets[0]
m = gets.to_i
rs = m.times.map{ gets }

xs = rs.select{|r| !r.include? n}


if xs.length == 0 then
  puts "none"
else
  xs.each{|x| puts x }
end
