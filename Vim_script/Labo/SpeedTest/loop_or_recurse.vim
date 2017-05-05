function! s:foldl_impl_loop(init, f, xs) abort
	let l:state = a:init
	for l:x in a:xs
		let l:state = a:f(l:state, l:x)
	endfor
	return l:state
endfunction

function! s:foldl_impl_recurse(state, f, xs) abort
	if empty(a:xs)
		return a:state
	endif
	let l:x         = a:xs[0]
	let l:xs        = a:xs[1:]
	let l:new_state = a:f(a:state, l:x)
	return s:foldl_impl_recurse(l:new_state, a:f, l:xs)
endfunction

let s:startTime = reltime()
echo s:foldl_impl_loop(0, {xs, x -> xs + x}, range(1, 50))
echo 'loop: ' . reltimestr(reltime(s:startTime))

let s:startTime = reltime()
echo s:foldl_impl_recurse(0, {xs, x -> xs + x}, range(1, 50))
echo 'recurse: ' . reltimestr(reltime(s:startTime))


" maxfuncdepth
"
"let s:startTime = reltime()
"echo s:foldl_impl_loop(0, {xs, x -> xs + x}, range(1, 100))
"echo 'loop: ' . reltimestr(reltime(s:startTime))
"
"let s:startTime = reltime()
"echo s:foldl_impl_recurse(0, {xs, x -> xs + x}, range(1, 100))
"echo 'recurse: ' . reltimestr(reltime(s:startTime))
