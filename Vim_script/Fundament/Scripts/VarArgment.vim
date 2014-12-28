
function! VarArgTest(...)
	for v in a:000
		echo 'arg: ' . v
	endfor
endfunction


