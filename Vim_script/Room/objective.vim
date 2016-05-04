
" Definition new method
function! s:new()
	" local scope
	let l:num = 10

	" script scope
	function! s:hoge() dict
		echo 'hoge'
	endfunction

	" naming by UpperCamelCase
	let HogeFoo = function('s:hoge')

	return l:
endfunction

" new object
let object = s:new()

" call members
echo object.num
call object.HogeFoo()

" dynamic add member
let  object.name = 'object'
echo object.name

