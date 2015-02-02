
# define class
class Hoge
	def initialize(name)
		@name = name
	end

	def foo
		print @name, ": foo\n"
	end
end

afo = Hoge.new("afo")
afo.foo
#afo.foge

# Append define class
class Hoge
	def foge
		print @name, ": foge\n"
	end
end

aho = Hoge.new("aho")
aho.foo
aho.foge
afo.foge
