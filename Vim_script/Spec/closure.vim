function! s:f() abort
	let l:x = 10
	function! s:g(y) abort closure
		return l:x + a:y
	endfunction

	return function('s:g')
endfunction

echo s:f()(20)
