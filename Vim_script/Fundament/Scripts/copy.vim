
let a = [1, [2], [3], 4, 5]
let b = copy(a)
let a[0] = 6
echo 'b is '
echon b

echo ''

let c = copy(a)
let a[1][0] = 7
echo 'c is '
echon c

echo ''

let d = deepcopy(a)
let a[2][0] = 8
echo 'a is '
echon a
echo 'd is '
echon d
