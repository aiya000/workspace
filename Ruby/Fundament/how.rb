# Destructive Method (!)
s = "hoge"
puts s.upcase
puts s
puts s.upcase!  # destructive!
puts s

print "\n"

# Boolean Method
t = ""
puts t.empty?  # method name is 'empty?', is not 'empty'
