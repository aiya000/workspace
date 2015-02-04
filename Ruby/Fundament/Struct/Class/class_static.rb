class Hoge
	@@staticAho = 10

	def self.afo
		puts "afooooouuu #{@@staticAho}"
	end
end

hoge = Hoge.new()
Hoge.afo
#puts Hoge.staticAho


class Foo < Hoge
end

Foo.afo


class Foge < Hoge
	def self.afo
		puts "fogeu #{@@staticAho}"
	end
end

Foge.afo
