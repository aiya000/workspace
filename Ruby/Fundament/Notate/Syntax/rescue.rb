# Simply throw(RuntimeError), catch, and finally
begin
	raise "foo"
rescue
	p $!
ensure
	puts "OK OK, succeed!"
end

# after notation
raise "aho" rescue puts "ahoda"


# if happend exception, print 'exception'
# if not happend, print 'succeed'
begin
	nil
rescue
	puts "exception"
else
	puts "succeed"
end

# retry it
n = 0
begin
	n += 1
	raise 1 if n < 4
rescue
	print "oh, "
	retry
ensure
	puts "retry end"
end

# method with rescue
def method
	raise "sugar"
rescue
	p $!
end
method


# throw original exception with message
# and specified Type only rescue
n = 0
class HogeException < Exception; end
begin
	raise HogeException, "hoge" if n < 1
	raise "RuntimeError"
rescue HogeException
	puts "HogeException cought"
	n += 1
	retry
end

# cought exception substitute to variable
begin
	raise HogeException.new("hoge")
	# same as over it
	raise HogeException, "hoge"
rescue => e
	p e
end


