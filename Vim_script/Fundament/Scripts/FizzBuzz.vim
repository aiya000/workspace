
" Simple
for i in range(1, 30)
	echo i . ': '
	if i%3 == 0 | echon 'Fizz' | endif
	if i%5 == 0 | echon 'Buzz' | endif
	echo ''
endfor

" Vital
let s:V = vital#of('vital')
let s:P = s:V.import('Prelude')
