def f(hash)
  puts hash
end

def g(num, hash)
  puts num, hash
end

# abbreviate hash's block
f a: 10, b: 20

# can if it is last argument
g 10, c: 30, d: 40
