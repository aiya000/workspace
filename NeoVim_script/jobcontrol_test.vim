let Shell = {}

function! Shell.on_stdout(job_id, data)
	call append(line('$'), 'job_id: ' . a:job_id . ', data: ' . join(a:data))
endfunction

function! Shell.on_stderr(job_id, data)
	call append(line('$'), 'job_id: ' . a:job_id . ', data: ' . join(a:data))
endfunction

function! Shell.on_exit(job_id, data)
	call append(line('$'), 'job_id[' . a:job_id . '] was exit')
endfunction


function! Shell.new(name, command)
	let l:instance    = extend(copy(g:Shell), {'name' : a:name})
	let l:instance.id = jobstart(a:command, l:instance)
	return l:instance
endfunction


"#--- --- ---#"


let s:for_command = ['bash', '-c', 'for i in {1..10}; do echo message $i!; sleep 1; done']
let s:for_loop    = Shell.new('foo', s:for_command)

call jobstop(s:for_loop.id)


"#--- --- ---#"


let s:shell = Shell.new('hoge', ['bash'])
call jobsend(s:shell.id, "ls\n")
call jobsend(s:shell.id, "exit\n")
call jobstop(s:shell.id)
