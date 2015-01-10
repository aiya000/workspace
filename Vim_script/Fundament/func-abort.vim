function! AbortTest() abort
	echo 10
	throw 'hoge'
	echo 20
	return 30
endfunction

echo AbortTest()
" This is right how to use ?
