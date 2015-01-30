class Hoge
	@@staticAho = 10

	def initialize(name)
		@name = name
	end

	def ahoge
		puts "hoge!! #{@name}!!"
	end

	def Hoge.afo
		puts "afooooouuu #{@@staticAho}"
	end
end

hoge = Hoge.new("aho")
p    hoge.ahoge
puts hoge == Hoge.new("aho")
Hoge.afo
#puts Hoge.staticAho

print "\n"


class Foge < Hoge
	def afoge
		puts "afoge!! #{@name}!?!?"
	end
end

foge = Foge.new("afoooo")
foge.ahoge
foge.afoge

print "\n"


class Hoo
	def initialize(elem)
		@elem = elem
	end

	def elem
		@elem
	end

	def setElem(elem)
		@elem = elem
	end
end

hoo = Hoo.new(10)
puts hoo.elem
#hoo.elem = 20
hoo.setElem(20)
puts hoo.elem

print "\n"


class Foo
	attr_accessor :elem
	attr_reader   :elem
	attr_writer   :elem

	def initialize(elem)
		@elem = elem
	end
end

foo = Foo.new(100)
foo.elem = 200
puts foo.elem
