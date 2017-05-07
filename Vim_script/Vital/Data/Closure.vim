let V = vital#vital#new()
let Closure = V.import('Data.Closure')

function! Plus(x, y) abort
	return a:x + a:y
endfunction


let f = Closure.from_funcref(function('Plus'))
echo Closure.call(f, 1, 2)

let g = f.with_args(1)
echo g.call(2)

let h = Closure.from_funcname('*Plus', [1])
let k = Closure.compose([h, g])  " h ○ g
echo k.call(1)

echo 'f is closure: ' . Closure.is_closure(f)
echo 'g is closure: ' . Closure.is_closure(g)
echo 'h is closure: ' . Closure.is_closure(h)
echo 'k is closure: ' . Closure.is_closure(k)

echo 'f is callable: ' . Closure.is_callable(f)
echo 'g is callable: ' . Closure.is_callable(g)
echo 'h is callable: ' . Closure.is_callable(h)
echo 'k is callable: ' . Closure.is_callable(k)


let f = Closure.from_expr('x + y', {'x': 1, 'y': 2})
echo f.call()

" let g = Closure.from_expr('= a:x + a:y', [1, 2])
" echo g.call()
