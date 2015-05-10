"NOTE: Imcompleted redo

function! s:zipper_shift() dict
	let l:under = self.under
	let l:over  = self.over

	let l:item = remove(l:under, -1)

	call add(l:over, l:item)

	return l:item
endfunction

function! s:zipper_unshift() dict
	let l:under = self.under
	let l:over  = self.over

	let l:item = remove(l:over, -1)
	call add(l:under, l:item)

	return l:item
endfunction

function! s:zipper_clear_under() dict
	let self.under = []
endfunction

function! s:zipper_clear_over() dict
	let self.over = []
endfunction

function! s:zipper_take_current() dict
	return self.under[0]
endfunction

function! s:zipper_get_zipper() dict
	return {'under' : self.under, 'over' : self.over}
endfunction

function! s:zipper_new(list) dict
	return extend({'under' : a:list}, self, 'keep')
endfunction

function! s:zipper_add_under(item) dict
	call add(self.under, a:item)
endfunction


let s:Zipper = {
\	'new'          : function('s:zipper_new'),
\	'add_under'    : function('s:zipper_add_under'),
\	'shift'        : function('s:zipper_shift'),
\	'unshift'      : function('s:zipper_unshift'),
\	'clear_under'  : function('s:zipper_clear_under'),
\	'clear_over'   : function('s:zipper_clear_over'),
\	'take_current' : function('s:zipper_take_current'),
\	'get_zipper'   : function('s:zipper_get_zipper'),
\	'under'        : [],
\	'over'         : []
\}


let s:xs = s:Zipper.new([])

call s:xs.add_under(10)
echo s:xs.get_zipper()
call s:xs.add_under(20)
echo s:xs.get_zipper()
echo s:xs.shift()
echo s:xs.get_zipper()
echo s:xs.shift()
echo s:xs.get_zipper()
echo s:xs.unshift()
echo s:xs.get_zipper()
echo s:xs.unshift()
echo s:xs.get_zipper()
