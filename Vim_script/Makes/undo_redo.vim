function! s:undoer_new() dict
	return deepcopy(self)
endfunction

function! s:undoer_push(elem) dict
	call add(self.data, a:elem)
	let self.stash = []
	VimConsoleLog ('push : '  . string(self.data) . ', ' . string(self.stash))
endfunction

function! s:undoer_undo() dict
	let elem = remove(self.data, -1)
	call add(self.stash, elem)
	VimConsoleLog ('undo : '  . string(self.data) . ', ' . string(self.stash))
endfunction

function! s:undoer_redo() dict
	let elem = remove(self.stash, 0)
	call add(self.data, elem)
	VimConsoleLog ('redo : '  . string(self.data) . ', ' . string(self.stash))
endfunction

let s:undoer = {
\	'data'  : [],
\	'stash' : [],
\	'new'   : function('s:undoer_new'),
\	'push'  : function('s:undoer_push'),
\	'undo'  : function('s:undoer_undo'),
\	'redo'  : function('s:undoer_redo')
\}

"#--- --- ---#"

function! s:input() abort
	VimConsoleClear
	try
		let undoer = copy(s:undoer)
		call undoer.push(10)
		call undoer.push(20)
		call undoer.undo()
		call undoer.undo()
		call undoer.redo()
		call undoer.push(30)
		call undoer.redo()  " EX
	catch
		VimConsoleLog v:exception
	endtry
endfunction

call s:input()
