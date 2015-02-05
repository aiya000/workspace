# has iterator like values
def f
	yield 10
	yield 20
	yield 30
end

# transfer iterator block to 'f'
def g(&block)
	f(&block)
end

g{|n| puts n}
