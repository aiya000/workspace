class Hoge
	def initialize(name)
		@name = name
	end

	def ahoge
		puts "hoge!! #{@name}!!"
	end
end

class Foge < Hoge
	def ahoge
		puts "afoge!! #{@name}!?!?"
		super
	end
end


a = Hoge.new("ahoge")
b = Foge.new("afoge")

a.ahoge
b.ahoge
