def to_point(h)
  s = h[:day].to_s
  if s.include? "5" then
    (h[:price] * 0.05).to_i
  elsif s.include? "3" then
    (h[:price] * 0.03).to_i
  else
    (h[:price] * 0.01).to_i
  end
end

def aggregator(h1, h2)
  if h1[-1][:day] == h2[:day] then
    h1[-1][:price] += h2[:price]
  else
    h1 << h2
  end
end


n   = gets.to_i
ts  = n.times.map{ gets.split.map{|x| x.to_i } }
hs  = ts.map{|x,y| {day: x, price: y} }
hs1 = hs.sort_by{|h| h[:day] }.reduce([{day: 0, price: 0}], &method(:aggregator))
rs = hs1.map{|h| to_point h }.reduce(:+)

puts rs
