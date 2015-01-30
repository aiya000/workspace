
10.times do |i|
	print "#{i} "
end
print "\n"

i = 0
while i < 10 do
	print "#{i} "
	i += 1
end
print "\n"

10.times do |i|
	if i == 1
		next
	end
	print "#{i} "
	if i == 3
		break
	end
end
print "\n"

for i in 0..10 do
	print "#{i} "
end
print "\n"

[10, 20, 30].each do |x|
	print "#{x}, "
end
print "\n"

{"hoge"=>10, "ahoge"=>20, "afoo"=>30}.each do |k,v|
	puts "#{k}: #{v}"
end
