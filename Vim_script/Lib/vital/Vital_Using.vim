let V = vital#of('vital')
let P = V.import('Prelude')
let L = V.import('Data.List')


"--- Data.List ---" {{{

let list = [1,2,3,4,5]
echo  '1: '
echon list
echo  '2: '
echon  L.push(list, 6)
echo  '3: '
echon  L.pop(list)
echo   list



" }}}
