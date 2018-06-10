let s:V  = vital#vital#new()
let s:C  = s:V.import('Data.Closure')
let s:CL = s:V.import('Data.List.Closure')

function! s:plus(x, y) abort
    return a:x + a:y
endfunction
let plus = s:C.from_funcref(function('s:plus'), [10])

let xs = range(0, 9)
echo s:CL.map(xs, plus)
" [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
