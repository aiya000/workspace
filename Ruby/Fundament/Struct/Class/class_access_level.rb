class Foo
	def foge
		puts "foge"
	end
	private :foge

	def hoo
		puts "hoo"
		foge
	end
	public :hoo

	def boo
		puts "boo"
	end
	public :boo
end

a = Foo.new
# a.foge
a.hoo
a.boo


# same as Foo
class Hoge
private
	def foge
		puts "foge"
	end

public
	def hoo
		puts "hoo"
		foge
	end

	def boo
		puts "boo"
	end
end

b = Hoge.new
b.hoo
b.boo
