"" Incompleted this file

let s:hitchars = 'abcdefghijklmnopqrstuvwxyz'
let s:charlen = strchars(s:hitchars)

function! s:get_char(over_count, index)
	if a:index >= s:charlen
	let l:a = a:index % s:charlen
	return s:hitchars[l:a]
endfunction

for s:i in range(26 * 2 + 2)
	echo s:get_char(0, s:i)
endfor
