let s:count = 1
function! s:foo(timer) abort
	echo s:count
	let s:count += 1
endfunction

call timer_start(300, function('s:foo'), {'repeat': 3})
