
let s:dict = {}
let s:dict.value = 10
let s:dict.dict = {}
echo s:dict['dict']
function! s:hoge()
	echo 'hoge'
endfunction
let s:dict.func = function('s:hoge')
call s:dict.func()



let s:base = {'value' : 10}
function! s:setBaseValue(value)
	let s:base.value = a:value
endfunction
let s:base.setValue = function('s:setBaseValue')
function! s:baseNew()
	return deepcopy(s:base)
endfunction
let s:base.new = function('s:baseNew')


let s:ins = s:base.new()
echo s:ins
echo s:ins.value
call s:ins.setValue(20)
echo s:ins.value
echo 'moo.'
