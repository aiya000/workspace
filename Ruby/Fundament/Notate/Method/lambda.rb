f = lambda{|x| x * 2}
puts f.call 10  # call lambda expression
puts f[10]      # call lambda expression with sugar


# itsumono
def g(x,y) x + y end
h = lambda{|y| g(20, y) }
puts h[30]
