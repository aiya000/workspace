" See job-options
function! Handler(status, stdout)
	"echomsg type(a:status)  "=> 9 (Channel)
	echomsg a:stdout
endfunction
let s:job = job_start('curl https://www.stackage.org/lts-5.14/hoogle?q=ByteString', {'out_cb' : 'Handler'})

command! Info   echo job_info(s:job)
command! Status echo job_status(s:job)
command! Stop   echo job_stop(s:job)

echo s:job
