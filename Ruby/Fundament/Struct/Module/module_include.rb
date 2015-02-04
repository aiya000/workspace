# module like the interface
module Hoga
	def hoge
		puts "Hoga#hoge"
	end
end

class Hugu
	include Hoga
end

#a = Hoga.new
a = Hugu.new
a.hoge


# module can extends other module
module Foga
	include Hoga
	def foge
		puts "Foga#foge"
	end
end
class Fugu
	include Foga
end

b = Fugu.new
b.hoge
b.foge
