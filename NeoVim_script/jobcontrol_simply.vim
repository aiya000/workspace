" This test copy from help [ job-control-usage ]

function! s:job_handler(job_id, data, event)
	if a:event ==# 'stdout'
		let l:str = self.shell . ' stdout: ' . join(a:data)
	elseif a:event ==# 'stderr'
		let l:str = self.shell . ' stderr: ' . join(a:data)
	else
		let l:str = self.shell . ' exited'
	endif

	call append(line('$'), l:str)
endfunction

let s:callbacks = {
\	'on_stdout' : function('s:job_handler'),
\	'on_stderr' : function('s:job_handler'),
\	'on_exit'   : function('s:job_handler')
\}

let s:job1 = jobstart(['bash'], extend({'shell': 'shell 1'}, s:callbacks))
let s:job2 = jobstart(['bash', '-c', 'for i in {1..10}; do echo hello $i!; sleep 1; done'], extend({'shell': 'shell 2'}, s:callbacks))
