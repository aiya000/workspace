"@See http://qiita.com/kamichidu/items/e3e6c16ed84b8f72de1b

function! PreviewDatbase(dbFileName, tableName)
	try
		let l:C = vdbc#connect_by_dsn('vdbc:sqlite3:dbname=./' . a:dbFileName)
		let l:data = l:C.select_as_dict('SELECT * FROM '.a:tableName.';')
		"let s:columns = []
		"for i in items(s:data[0])
		"	call add(s:columns, i[0])
		"endfor

		"for indexText in s:columns
		"	echon indexText
		"	echon "\t"
		"endfor
		"echo "\n"

		"for row in s:data
		"	for index in s:columns
		"		echon row[index]
		"		echon "\t"
		"	endfor

		"	echon "\n"
		"endfor

		echo l:data
		for i in range(0, len(l:data)-1)
			let row = l:data[i]
			echo printf("\n********** row%d **********\n", i+1)
			for col in items(row)
				echo col[0] . " : " . col[1]
			endfor
		endfor
		echo "\n***************************\n"

	finally
		if exists('s:C')
			call s:C.disconnect()
		endif
	endtry
endfunction

call PreviewDatbase('test.db', 'Test')
