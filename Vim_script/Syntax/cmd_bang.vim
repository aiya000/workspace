
command! -bang BangTest :e<bang> %
" :BangTest
" :BangTest!


function! BangBang(b)
	if a:b
		echo 'bang!'
	else
		echo 'hogehoge'
	endif
endfunction

command! -bang BangFunny call BangBang(<bang>0)
