
function! s:hoge_int()
	return 10
endfunction

function! s:hoge_double()
	return 20.0
endfunction

function! s:hoge_string()
	return "30"
endfunction

echo s:hoge_{'int'}()
echo s:hoge_{'double'}()
echo s:hoge_{'string'}()

