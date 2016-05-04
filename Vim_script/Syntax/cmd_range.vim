
function! Range() range
	echo 'first line is ' . a:firstline
	echo 'last line is ' . a:lastline
endfunction

command! -range=% RangeTest :<line1>, <line2> call Range()
