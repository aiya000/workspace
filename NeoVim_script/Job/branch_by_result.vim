let s:stdout_result = ''
let s:stderr_result = ''

function! s:foo(_, data, call_type) abort
	if a:call_type ==# 'stdout'
		let s:stdout_result .= string(a:data)
	elseif a:call_type ==# 'stderr'
		let s:stderr_result .= string(a:data)
	else
		" when succeed
		if empty(s:stderr_result)
			echomsg 'succeed: ' . s:stdout_result
		else
			echomsg 'failed: ' . s:stdout_result . ', ' . s:stderr_result
		endif
	endif
endfunction

call jobstart('echo ahoge', {
\	'on_stdout' : function('s:foo'),
\	'on_stderr' : function('s:foo'),
\	'on_exit'   : function('s:foo'),
\})
