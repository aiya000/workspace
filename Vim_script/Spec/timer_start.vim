let s:count = 0
function! Handler(timer)
	let s:count += 1
	echo 'count> ' . s:count
	echo a:timer
endfunction

function! s:main() abort
	let l:interval = 500
	let l:options  = { 'repeat' : 5 }
	let l:id       = timer_start(l:interval, 'Handler', l:options)
endfunction
call s:main()
