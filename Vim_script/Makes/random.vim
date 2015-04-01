" Low accuracy randome integer
function! s:random_int(max)
	let l:max = a:max isnot# '' ? a:max : 65535

	let l:matchEnd = matchend(reltimestr(reltime()), '\d\+\.') + 1
	return reltimestr(reltime())[l:matchEnd :] % (l:max + 1)
endfunction

command! -nargs=? PutRandom execute 'normal! a' . s:random_int(<q-args>)
