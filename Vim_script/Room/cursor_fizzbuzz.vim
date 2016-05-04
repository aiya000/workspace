
function! ToFizzBuzz(num)
	if a:num == 0 | return a:num | endif
	return
	\	a:num%3 == 0 ? a:num%5 == 0 ? "FizzBuzz"
	\		                        : "Fizz"
	\		                        : a:num%5 == 0 ? "Buzz"
	\			                                   : a:num
endfunction

" 1
" 2
" 3
" 5
" 7
" Fizz
" 19
" 31
" 50

function! CursorNumReplaceToFizzBuzz()
	let l:word = expand('<cword>')
	if l:word == 0
		return
	endif

	execute 'normal b'
	if l:word != expand('<cword>')
		execute 'normal W'
	endif

	let l:nword = str2nr(l:word)
	execute 'normal "_dw'
	let @+ = ToFizzBuzz(l:nword)
	execute 'normal "+p'
endfunction
