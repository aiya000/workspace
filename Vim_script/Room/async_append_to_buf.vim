let s:CHARS = 'abcdefghijklmnopqrstu'
if !islocked('s:CHARS')
	lockvar s:CHARS
endif
let s:count = 0

function! AppendToBuf(timer)
	let l:target_buf = bufwinnr('foobuf')
	if l:target_buf == -1
		return
	endif
	execute l:target_buf 'wincmd w'
	put!=s:CHARS[s:count]
	let s:count += 1
	wincmd p
endfunction

"-------------------"

new foobuf
setl buftype=nofile filetype=target noswapfile
let s:timer = timer_start(500, 'AppendToBuf', {'repeat': strchars(s:CHARS)})
command! Stop call timer_stop(s:timer)
