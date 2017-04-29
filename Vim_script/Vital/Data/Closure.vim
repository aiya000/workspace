let s:V = vital#vital#new()
let s:Closure = s:V.import('Data.Closure')

function! s:plus(x, y) abort
	return a:x + a:y
endfunction


function! s:main() abort
	let l:f = s:Closure.from_funcref(function('s:plus'))
	echo s:Closure.call(l:f, 1, 2)

	let l:g = l:f.with_args(1)
	echo l:g.call(2)
endfunction
call s:main()
