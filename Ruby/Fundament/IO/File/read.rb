# Simply Loop
file = open("files.rb")  # if want to specify read only,
while line = file.gets   # execute 'open("files.rb", "r")'
	puts line
end
file.close
puts

# Iterator
file = open("files.rb")
file.each do |line|
	puts line
end
file.close
puts

# Autoclose
open("files.rb") do |file|
	file.each do |line|
		puts line
	end
end
