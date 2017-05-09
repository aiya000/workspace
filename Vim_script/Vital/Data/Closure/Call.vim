let Closure = vital#vital#new().import('Data.Closure')

function! s:f(x, y) abort
	return printf('(%d, %d)', a:x, a:y)
endfunction

let F = function('s:f')
let g = Closure.from_funcref(F)
let h = Closure.from_expr('printf("(%d, %d)", a:1, a:2)')
echo Closure.apply(F, [1, 2])
echo Closure.apply(g, [1, 2])
echo Closure.apply(h, [1, 2])
