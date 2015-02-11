# has iterator like values
def f
  yield 10
  yield 20
  yield 30
end

# transfer iterator block to 'f'
def g(&block)  # If you want to know more,
  f(&block)    #   read './higher_method.rb'
end            #

g{|n| puts n}
