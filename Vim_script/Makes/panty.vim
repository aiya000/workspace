scriptencoding utf-8

let s:filename = expand('<sfile>')

function! s:fly_panty()
	silent new
	silent only

	setl buftype=nofile
	setl noswapfile
	setl nonumber
	setl nolist
	setl nowrap
	setl nocursorline
	setl nocursorcolumn
	setl noundofile

	let l:file        = readfile(s:filename)
	let l:panty_num   = index(l:file, 'finish') + 1
	let l:panty_lines = map(l:file[l:panty_num : ], 'v:val[1 : ]')

	let l:panties = join(l:panty_lines, "\n")

	let l:panties_pages = split(l:panties, "---\n")

	let l:i        = 0
	let l:page_len = len(l:panties_pages)

	while 1
		let l:panty_page = split(l:panties_pages[l:i % l:page_len], "\n")
		for l:line in reverse(l:panty_page)
			call append(0, l:line)
		endfor
		let l:i += 1
		redraw
		sleep 250m
		normal! gg"_dG
	endwhile
endfunction


command! FlyPanty call s:fly_panty()

finish
"     ＿＿＿＿＿
"    (＼   ∞  ﾉ      ＿＿＿＿＿
"     ＼ヽ    /      (＼   ∞  ﾉ
"       ヽ)⌒ﾉ        ＼ヽ    /
"          ￣           ヽ)⌒ﾉ                                            ＿＿＿＿＿
"                          ￣                                            (＼   ∞  ﾉ
"                               ＿＿＿＿＿                                ＼ヽ    /
"           ＿＿＿＿＿         (＼   ∞  ﾉ                                  ヽ)⌒ﾉ
"          (＼   ∞  ﾉ          ＼ヽ    /         ＿＿＿＿＿                   ￣
"           ＼ヽ    /             ヽ)⌒ﾉ         (＼   ∞  ﾉ
"             ヽ)⌒ﾉ                 ￣          ＼ ヽ    /
"                ￣                                 ヽ)⌒ﾉ
"                                                      ￣
"
"                                                          ＿＿＿＿＿
"                              ＿＿＿＿＿                 (＼   ∞  ﾉ
"                             (＼   ∞  ﾉ                  ＼ヽ    /
"                              ＼ヽ    /                     ヽ)⌒ﾉ
"                                ヽ)⌒ﾉ                         ￣
"                                   ￣
"
"                                                     ＿＿＿＿＿
"                                                    (＼   ∞  ﾉ
"                                                     ＼ヽ    /
"                                                       ヽ)⌒ﾉ
"                                                          ￣
"---
"          ＿＿＿＿＿
"         (＼   ∞  ﾉ      ＿＿＿＿＿
"          ＼ヽ    /      (＼   ∞  ﾉ
"            ヽ)⌒ﾉ        ＼ヽ    /
"               ￣           ヽ)⌒ﾉ                                            ＿＿＿＿＿
"                               ￣                                            (＼   ∞  ﾉ
"                                    ＿＿＿＿＿                                ＼ヽ    /
"                ＿＿＿＿＿         (＼   ∞  ﾉ                                  ヽ)⌒ﾉ
"               (＼   ∞  ﾉ          ＼ヽ    /         ＿＿＿＿＿                   ￣
"                ＼ヽ    /             ヽ)⌒ﾉ         (＼   ∞  ﾉ
"                  ヽ)⌒ﾉ                 ￣          ＼ ヽ    /
"                     ￣                                 ヽ)⌒ﾉ
"                                                           ￣
"
"                                                               ＿＿＿＿＿
"                                   ＿＿＿＿＿                 (＼   ∞  ﾉ
"                                  (＼   ∞  ﾉ                  ＼ヽ    /
"                                   ＼ヽ    /                     ヽ)⌒ﾉ
"                                     ヽ)⌒ﾉ                         ￣
"                                        ￣
"
"
"                                                     ＿＿＿＿＿
"                                                    (＼   ∞  ﾉ
"                                                     ＼ヽ    /
"                                                       ヽ)⌒ﾉ
"                                                          ￣
"---
"               ＿＿＿＿＿
"              (＼   ∞  ﾉ      ＿＿＿＿＿
"               ＼ヽ    /      (＼   ∞  ﾉ
"                 ヽ)⌒ﾉ        ＼ヽ    /
"                    ￣           ヽ)⌒ﾉ                                            ＿＿＿＿＿
"                                    ￣                                            (＼   ∞  ﾉ
"                                         ＿＿＿＿＿                                ＼ヽ    /
"                     ＿＿＿＿＿         (＼   ∞  ﾉ                                  ヽ)⌒ﾉ
"                    (＼   ∞  ﾉ          ＼ヽ    /         ＿＿＿＿＿                   ￣
"                     ＼ヽ    /             ヽ)⌒ﾉ         (＼   ∞  ﾉ
"                       ヽ)⌒ﾉ                 ￣          ＼ ヽ    /
"                          ￣                                 ヽ)⌒ﾉ
"                                                                ￣
"
"                                                                    ＿＿＿＿＿
"                                        ＿＿＿＿＿                 (＼   ∞  ﾉ
"                                       (＼   ∞  ﾉ                  ＼ヽ    /
"                                        ＼ヽ    /                     ヽ)⌒ﾉ
"                                          ヽ)⌒ﾉ                         ￣
"                                             ￣
"
"
"                                                          ＿＿＿＿＿
"                                                         (＼   ∞  ﾉ
"                                                          ＼ヽ    /
"                                                            ヽ)⌒ﾉ
"                                                               ￣
"---
"                   ＿＿＿＿＿
"                  (＼   ∞  ﾉ      ＿＿＿＿＿
"                   ＼ヽ    /      (＼   ∞  ﾉ
"                     ヽ)⌒ﾉ        ＼ヽ    /
"                        ￣           ヽ)⌒ﾉ                                            ＿＿＿＿＿
"                                        ￣                                            (＼   ∞  ﾉ
"                                             ＿＿＿＿＿                                ＼ヽ    /
"                         ＿＿＿＿＿         (＼   ∞  ﾉ                                  ヽ)⌒ﾉ
"                        (＼   ∞  ﾉ          ＼ヽ    /         ＿＿＿＿＿                   ￣
"                         ＼ヽ    /             ヽ)⌒ﾉ         (＼   ∞  ﾉ
"                           ヽ)⌒ﾉ                 ￣          ＼ ヽ    /
"                              ￣                                 ヽ)⌒ﾉ
"                                                                    ￣
"
"                                                                        ＿＿＿＿＿
"                                            ＿＿＿＿＿                 (＼   ∞  ﾉ
"                                           (＼   ∞  ﾉ                  ＼ヽ    /
"                                            ＼ヽ    /                     ヽ)⌒ﾉ
"                                              ヽ)⌒ﾉ                         ￣
"                                                 ￣
"
"
"                                                              ＿＿＿＿＿
"                                                             (＼   ∞  ﾉ
"                                                              ＼ヽ    /
"                                                                ヽ)⌒ﾉ
"                                                                   ￣
