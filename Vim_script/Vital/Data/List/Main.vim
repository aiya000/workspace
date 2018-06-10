let s:L = vital#vital#new().import('Data.List')

function! s:succ(x) abort
    return a:x + 1
endfunction

" ラムダ式
let Succ = { x -> x + 1 }

" 関数参照
let Succ_ = function('s:succ')

let xs = range(0, 9)
echo s:L.map(xs, Succ) == s:L.map(xs, Succ_)
" 1
