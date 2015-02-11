def apply(&func)
  func.call
end

def f()
  puts "hoge"
end

# method is not object, method needs 'method' method
apply(&method(:f))

# lambda is object, lambda can throw to higher method simply
apply(&lambda{ puts "afoo" })


#- - - - - - -#


def apply_with(*args, &f)
  f.call(*args)
end

def g(x, y)
  x + y
end

p apply_with(10, 20, &method(:g))
p apply_with(10, 20, &lambda{|x, y| x + y })
