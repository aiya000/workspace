" Catenate and echo files
function! s:cat_file(...)
	let l:catenate = ''

	for l:filePath in a:000
		let l:catenate .= join(readfile(l:filePath), "\n")
	endfor

	echo l:catenate
endfunction

command! -nargs=* -complete=file Cat call s:cat_file(<f-args>)
