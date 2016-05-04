
function! Fibonacci(i)
	if a:i <= 0
		return 0
	elseif a:i == 1
		return 1
	endif

	return a:i + Fibonacci(a:i - 1)
endfunction

echo Fibonacci(2)


