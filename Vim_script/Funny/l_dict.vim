
function! s:_()
	function! s:f()
		let a = 1
		let b = 2
		let c = {}
		function! s:g()
			echo 'd'
		endfunction
		let D = function('s:g')
		return l:
	endfunction
	let l = s:f()
	echo l
	call l.D()

	let l.a = 10

	let s = s:f()
	echo s.a
	echo l
	echo s
endfunction

call s:_()
