module Ahoo
	def fofo
		puts "fofo"
	end

	def hoho
		puts "hoho"
	end
	module_function :hoho
end

#Ahoo.fofo
Ahoo.hoho


# global include
include Ahoo
Ahoo.fofo
fofo
hoho
