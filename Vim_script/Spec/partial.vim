function! s:f(x, y) abort
	return a:x + a:y
endfunction

let s:g = function('s:f', [10])
echo s:g(20)
