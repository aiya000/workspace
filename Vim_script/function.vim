function! s:baz(funcname, params) abort
	let l:local = {
	\	'funcname' : a:funcname,
	\	'params'   : a:params
	\}
	function! l:local.binder() dict abort
		echo self.funcname self.params
	endfunction
	return function(l:local.binder)
endfunction

let s:foo = s:baz('poko', 'hoge')
call s:foo()
