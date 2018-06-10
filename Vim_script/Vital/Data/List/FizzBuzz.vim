let s:L = vital#vital#new().import('Data.List')

let xs = range(0, 50)
let xs = s:L.map(xs, { x ->
    \   (x % 5 == 0) && (x % 3 == 0) ? 'FizzBuzz'
    \ : (x % 5 == 0) ? 'Fizz'
    \ : (x % 3 == 0) ? 'Buzz'
    \                : string(x)
\ })

function! s:p(x) abort
    return a:x ==# 'Fizz'
endfunction

let xs = s:L.filter(xs, function('s:p'))
echo s:L.all(function('s:p'), xs)
" 1
