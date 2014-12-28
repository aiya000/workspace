
function! s:throw()
	throw 'exception'
endfunction

try
	call s:throw()
catch
	echo 'hoge'
endtry
