reg = /aho/
puts reg == Regexp.new('aho')

puts reg =~ "ahoge"
puts reg =~ "hogeaho"
puts (reg =~ "afoge") == nil
