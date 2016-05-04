function! s:func()
	let x = {'func' : function('s:func')}
	return x
endfunction

let a = s:func()
let b = a.func()

echo a
echo b
