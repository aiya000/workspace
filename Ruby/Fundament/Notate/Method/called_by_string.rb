def f; puts "called f"; end
def g; puts "called g"; end
def h; puts "called h"; end


# called by string as name
__send__ "f"

# and can use symbol
fs = [:f, :g, :h]
fs.each{|f| __send__ f}
