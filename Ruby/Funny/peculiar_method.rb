a = 'ahoge'
def a.foo
	puts 'afoooge'
end

b = 'ahoge'

a.foo
#b.foo


# same as a.foo
c = 10
class << c
	def succsucc
		c + 2
	end
end
puts c.succsucc
