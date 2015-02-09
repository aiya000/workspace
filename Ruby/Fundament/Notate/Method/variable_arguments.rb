def f(*xs)
  xs.each do |x|
    p x
  end
end

f(1, 2, 3, "a", "b", "c")  # dynamic Typing is funny
