class Foo
	attr_accessor :elem

	def initialize(elem)
		@elem = elem
	end
end

a = Foo.new(10)
puts a.elem  # reader
a.elem = 20  # writer
puts a.elem


# same as 'Foo'
class Hoo
	attr_reader   :elem
	attr_writer   :elem

	def initialize(elem)
		@elem = elem
	end
end

b = Hoo.new(10)
puts b.elem
b.elem = 20
puts b.elem
