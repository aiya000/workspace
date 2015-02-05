# My template add to Module class
class Module
	def attr_reader1(name)
		module_eval %-
			def #{name.id2name}() @#{name.id2name} end
		-
	end
	def attr_ahoge(name)
		module_eval %-
			def #{name.id2name}() "ahoge" end
		-
	end
end


class Hoge
	attr_reader1 :hoge
	attr_ahoge   :xxx

	def initialize(hoge, xxx)
		@hoge = hoge
		@xxx  = xxx
	end
end

a = Hoge.new("hoge", 10)
puts a.hoge  # same as attr_reader
puts a.xxx   # Oh..., Type..., Benri...
