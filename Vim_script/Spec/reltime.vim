"@See('http://leafcage.hateblo.jp/entry/2013/08/02/001600')
" Time Watcher
command! TimerStart let  s:startTime = reltime()
command! TimerEcho  echo reltimestr( reltime(s:startTime) )
command! TimerPut   execute 'normal! o' . reltimestr(reltime(s:startTime))
