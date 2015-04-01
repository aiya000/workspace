# Ruby's operator= do reference copy

a = {set_name: lambda{|name| @name = name},
     get_name: lambda{ @name }}

p a[:get_name][]
a[:set_name]["hoge"]
p a[:get_name][]


b = a
p b[:get_name][]
b[:set_name]["ahoo"]
p a[:get_name][]
