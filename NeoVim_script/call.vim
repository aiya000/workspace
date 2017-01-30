function! s:echo(msg) abort
	echo a:msg
endfunction
call call(function('s:echo'), ['ahoge'])
