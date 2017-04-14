let s:bufnum1 = bufnr('$')
echo s:bufnum1
new nameA  " Increment buffer num
let s:bufnum2 = bufnr('$')
echo s:bufnum2
bd nameA   " didn't Decrement buffer num
let s:bufnum3 = bufnr('$')
echo s:bufnum3
new nameB
let s:bufnum4 = bufnr('$')
echo s:bufnum4
