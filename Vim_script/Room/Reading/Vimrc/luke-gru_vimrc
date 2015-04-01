call pathogen#infect()
set nocompatible " Not compatible with vi.

if has("autocmd")
  filetype plugin on " All plugins are on by default.
  filetype indent on
endif

" My computers: fonts, dictionary, etc...
if hostname() == "luke-K52F"
  set guifont=Inconsolata\ Medium\ 12
  set swapsync=fsync
  set dictionary=usr/dict/words
elseif has("mac")
  set guifont=Monaco:h12
elseif has("win32")
  set guifont=Consolas:h11,Courier\ New:h10
elseif has("unix")
  set dictionary=usr/dict/words
  set swapsync=fsync
  if &guifont == ""
    set guifont=bitstream\ vera\ sans\ mono\ 10
  endif
endif

" *terminal colors*
set t_Co=256
set background=dark

if (&t_Co == 256 || &t_Co == 88) && !has('gui_running')
  " terminal
  colorscheme xoria256
elseif &diff
  " diff
  colorscheme peaksea
else
  " gvim
  colorscheme xoria256
endif
" /terminal colors

set ruler
set title
set list " Show me listchars.
" Mapleader is spacebar.
let mapleader=" "
let maplocalleader='\'
set report=0 " Always report when changing lines.
set more " Pause listings when whole screen is filled.
set modelines=5 " Just to make sure.
set pastetoggle=<F2>
set winaltkeys=no " Allow use of <alt> for mappings by disabling window alt.
set tags=tags;,tags
set textwidth=78 " Overridden local to buffer for certain filetypes,
" see autocommands
set virtualedit=block " So useful, f11 virtualedit=all, f9 back to block.
set nojoinspaces " Oh historical reasons... for SHAME.
set hls " Highlight search.
set foldcolumn=1 " Must... see... folds.
set foldmethod=marker " Marker folding styles.
set iskeyword+=-
" Start statusline with a blank slate.
set statusline=
set statusline+=%2*#%n%*\        " Flags and buf num.
set statusline+=%t\              " Tail of the filename
set statusline+=%y\              " Filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " File encoding
set statusline+=%{&ff}]\         " File form
set statusline+=%r               " Read only flag
set statusline+=%m               " Modified flag
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%=        " Left/right separator
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
set statusline+=c=%02c,   " x=cursor column
set statusline+=l=%l/%L   " y=cursor line/total lines
set statusline+=\ (%P)    " percent through file
set showmode
set showcmd
set showmatch " Matching brackets
set magic     " See pattern.txt
set autoread  " When a file is changed outside of vim and it's in the buffer.
set switchbuf=useopen " Jump to first open window that contains the buffer.
set lazyredraw    " Don't redraw screen when running macros.
set matchtime=3   " 3/10 of second paren matches.
set wildmenu      " Give me menu for tab completion.
set wildmode=full " All I need (and default).
set wildcharm=<C-z> " Let me tab a cmdline mapping.
set wildignore+=*~
set wildignore+=*.DS_Store?,*.0,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set suffixes+=.git,.hg,.svn,tags " Lower priority for wildmenu.
set noerrorbells  " No annoying little vi error noises!
set novisualbell
set scrolloff=3   " Give me context of 3 lines when at top v bottom of buffer
set sidescrolloff=2
set timeoutlen=1250
set ttimeoutlen=50
set nobackup
set tabstop=2     " This is how many columns each literal tab indents.
set softtabstop=2 " This is how many columns each tab key hit counts for in
" INSERT mode. If noexpandtab is set and tabstop=softtabstop, VIM always uses
" tabs.
set expandtab " Replace tab characters with spaces.
set sw=2 " Shiftwidth
set shiftround " When indenting with >>, <<, do to nearest sw.
set listchars=tab:>−,trail:−
set nowrap     " Don't wrap text by default, tw=0.
if filereadable("/usr/bin/par")
  set formatprg=par " Use par to format paragraphs. Default tw is 72.
endif
set ai " Auto indent
set si " Smart indent
set cpoptions+=$ " Compatibility with vi options, when using nmode c or C,
" show last changed character with $ instead of its value.
set nu " Line numbering
set incsearch   " Show search matches incrementally.
set ignorecase  " Ignore the case of regexes,
set smartcase   " but don't ignore them when I type a capital letter.
set mousehide  " Hide mouse until it's moved.
set mouse=a
set mousemodel=popup " Windows at least got this right.
set history=40 " Command-line history remembered. Default = 20
set bs=2       " Backspace over everything in insert mode
set cmdheight=3 " Cmd line height.
" The include path for current file, and the find command and its variants.
set path+=.,,./**
set laststatus=2  " All windows have status lines
set shortmess=at  " To avoid the 'Hit ENTER to continue' promp

set noequalalways " Don't auto-same size all windows when splitting or
" closing.
set winfixwidth   " Splits resize width of current window only
" (good for vsplits).
set splitright    " Verti. splits open on the right
set splitbelow    " Horiz. splits open below current window
set helpheight=20 " Minimum height for help wins, default=20, 0 is default
" for splits.
" *startup info and sessions*
set sessionoptions-=options
set viminfo+='15,<500,s15,h,:50,/50

" *encoding (set)*
" http://vim.wikia.com/wiki/Working_with_Unicode
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
" /encoding (set)

if exists("+spelllang")
  set spelllang=en_us
endif

if isdirectory(glob("~/.vim/views"))
  set viewdir=~/.vim/views " Dir where mkview files are stored.
else
  set viewdir=/tmp
endif

if isdirectory(glob("~/.vim/backup"))
  set directory=~/.vim/backup
else
  set directory=/tmp
  echoerr "Backup directory ~/.backup doesn't exist!"
endif

if version >= 703
  set undofile
  if has("unix")
    set undodir=/tmp
  endif
endif

" *diff stuff*
set diffopt+=vertical,context:4,iwhite
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Sometimes I find it useful to treat wrapped lines as separate lines.
funct! ToggleWrapKeys()
  if &wrap == 1
    set nowrap
    nnoremap j j
    nnoremap k k
    vnoremap j j
    vnoremap k k
    echo "wrap keys off"
  elseif &wrap == 0
    set wrap
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
    echo "wrap keys on"
  endif
endfunction
command! -nargs=0 WK call ToggleWrapKeys()

" diff mappings
nnoremap <leader>dh :DiffOrig<CR>
" mnemonic of 'diff HEAD'
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>do :diffoff<CR>
" /diff stuff

" *edit file in same dir. as current buffer mappings*
nnoremap <leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
" /edit mappings

" cd relative to getcwd()
nnoremap <leader>cd :cd <C-R>=expand("%:p:h") <CR>
nnoremap <leader>cp :cprevious<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cc :cclose<CR>

nnoremap <leader>q :q<CR>

" vsplit alternate buffer to the right
nnoremap <leader>sar :execute "rightbelow vsplit " . bufname("#")<CR>
" vsplit alternate buffer to the left
nnoremap <leader>sal :execute "leftabove  vsplit " . bufname("#")<CR>
" split alternate buffer below
nnoremap <leader>sab :execute "rightbelow  split " . bufname("#")<CR>
" split alternate buffer above
nnoremap <leader>saa :execute "leftabove   split " . bufname("#")<CR>

iabbr myemail luke<DOT>gru<AT>gmail<DOT>com

" sessions, views and projects
cabbr sess source ~/.vim/sessions/
cabbr mks mks! ~/.vim/sessions/
cabbr mkv mkview &viewdir

cabbr Ls ls
cabbr LS ls
cabbr W w
cabbr B# b#

" *plugin stuff*
let g:syntastic_auto_loc_list=1
let g:bufExplorerSplitRight=1
let g:bufExplorerShowRelativePath=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=0
let NERDTreeWinSize=24

nnoremap <leader>se :SyntasticEnable<CR>
nnoremap <leader>sd :SyntasticDisable<CR>
nnoremap <silent> <leader>a :Ack <cWORD><CR>
nnoremap <silent> <leader>be :BufExplorer<CR>
nnoremap <silent> <leader>la :h local-additions<CR>
nnoremap <silent> <leader>t :silent! TlistClose<CR>:NERDTreeToggle<CR>
nnoremap <silent> <leader>g :silent! NERDTreeClose<CR>:TlistToggle<CR>
nnoremap <leader>h :call g:chromaHighlight()<CR>
" /plugin stuff

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = virtcol(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position.
  let @/=_s
  call cursor(l, c)
endfunction

" *n- and i-mode mappings*
" Stop hightlighting for hlsearch, turn back on w/ next search.
nnoremap <leader>n :noh<CR>

command! -bar -nargs=0 Bigger :let &guifont =
      \ substitute(&guifont,'\d\+$','\=submatch(0)+1','')
command! -bar -nargs=0 Smaller :let &guifont =
      \ substitute(&guifont,'\d\+$','\=submatch(0)-1','')
" /colorschemes and font types

" clipboard yank
nnoremap <C-y> "+y
nnoremap <C-\> "+p
" clipboard paste
inoremap <C-\> <ESC>"+p$

" default yanking remaps
nnoremap Y y$
nnoremap gy :call Preserve("normal 0y$")<CR>

" Set the indent width to 2, 4, or 8
nnoremap <Leader>2 :setlocal tabstop=2 shiftwidth=2<CR>
nnoremap <Leader>4 :setlocal tabstop=4 shiftwidth=4<CR>
nnoremap <Leader>8 :setlocal tabstop=8 shiftwidth=8<CR>

" --TABS MAPPINGS--
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
" --/TABS MAPPINGS--

" fold mappings
nnoremap <silent> <CR> za
" fold start (closed, open)
nnoremap <silent> <leader>fc :set foldlevel=0<CR>
nnoremap <silent> <leader>fo :set foldlevel=99<CR>
" /fold mappings

noremap <silent> <F3> <ESC>:e $MYVIMRC<CR>
noremap <silent> <F4> <ESC>:so $MYVIMRC<CR>

" making [count] newlines below cursor
nnoremap <leader>; o<ESC>
" split, like a reversed J(join)
nnoremap S i<CR><ESC>
" append, until the end of this line, to the line below
nnoremap gA "xd$$ja<SPACE><ESC>"xp
" different from gA, this is equivalent to going back to where gi would take
" you, then moving to the beginning of the line.
nnoremap gI g;I

nnoremap <F9> :set virtualedit=block<CR>
nnoremap <F10> <nop>
nnoremap <F11> :set virtualedit=all<CR>

" set list! (toggle)
nnoremap <leader>lt :set list!<CR>:set list?<CR>

" indenting, useful stuff..
vnoremap < <gv
vnoremap > >gv

" Highlight text I just pasted, compliments gv well.
nnoremap gV `[v`]

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" don't move on *
nnoremap * *<C-o>

" ESCaping
inoremap <A-m> <ESC>

" emacs... don't tell anyone
inoremap <C-e> <ESC>A
inoremap <C-a> <ESC>I
inoremap <C-b> <ESC>i
inoremap <C-f> <ESC><right>a

" *omnicompletion*
" Default i_CTRL-o I find useless, so map it to omnicomplete
inoremap <silent> <C-o> <C-x><C-o>

" Locate and return character above current cursor position regardless of
" blank lines. Taken from this vim-scripting tutorial:
" http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
function! LookUpOrDown(dir)
  if a:dir ==# 'down'
    let pat = 'nW'
  elseif a:dir ==# 'up'
    let pat = 'bnW'
  else
    throw "LookUpOrDown: dir must be one of ('up', 'down')"
  endif
  " Locate current column and preceding line from which to copy.
  let column_num      = virtcol('.')
  let target_pattern  = '\%' . column_num . 'v.'
  let target_line_num = search(target_pattern . '*\S', pat)

  " If target line found, return vertically copied character.
  if !target_line_num
    return ""
  else
    return matchstr(getline(target_line_num), target_pattern)
  endif
endfunction

" Reimplement CTRL-Y and CTRL-E in insert mode...
inoremap <silent>  <C-Y>  <C-R><C-R>=LookUpOrDown("up")<CR>
inoremap <silent>  <C-E>  <C-R><C-R>=LookUpOrDown("down")<CR>

nnoremap <leader>= :call Preserve("normal gg=G")<CR>
" /n- and i-mode mappings

" *c-mode mappings*
cnoremap <C-b> <left>
cnoremap <C-f> <right>
cnoremap <C-a> <C-b>
" classic... <C-w> for root
cnoremap <silent> <C-w> w !sudo tee % > /dev/null<CR>
" /c-mode mappings

" *v-mode mappings*
vnoremap <C-y> "+y
" /v-mode mappings

" *o-mode mappings*
" parameters
onoremap p i(
" inner next paren pair
onoremap in( :<c-u>normal! f(vi(<CR>
" inner last paren pair
onoremap ip( :<c-u>normal! F)vi(<CR>
" /o-mode mappings

" *syntax groups*
" Show syntax highlighting groups for word under cursor.
nnoremap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" /syntax groups

" *working with wrapped text*
" softwrap
command! -nargs=0 Swrap setl wrap linebreak nolist showbreak=…
" ellipsis: unicode 2026
" /working with wrapped text


" View markup'd markdown in browser (linux).
nnoremap <leader>pm :w!<CR>:!markdown % > %.html && sensible-browser
      \ file://%:p.html<CR><CR>

" Add modeline to file with current settings.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! InsertModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("0"), l:modeline)
endfunction

function! InsertRubyShebang()
  let l:shebang = "#!/usr/bin/env ruby"
  call append(line("0"), l:shebang)
endfunction

command! -nargs=0 Rsheb call InsertRubyShebang()
command! -nargs=0 Mode call InsertModeline()
command! -nargs=* Xe !chmod +x <args>
command! -nargs=0 Xe !chmod +x %

" From https://github.com/tpope/tpope/blob/master/.vimrc
function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" Open URL under cursor in browser.
nnoremap gB :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL
      \ http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

" Turn on/off sql highlighting for PHP files.
silent! function! PHP_sql_color_on()
  let g:php_sql_query=1
endfunction

silent! function! PHP_sql_color_off()
  if exists("g:php_sql_query")
    unlet g:php_sql_query
  endif
endfunction

function! FoldView()
  if &cursorline
    windo set foldcolumn=1
    if exists("+cursorcolumn")
      set nocursorcolumn nocursorline
    endif
  else
    windo set foldcolumn=2
    if exists("+cursorcolumn")
      set cursorline
    endif
  endif
endfunction
command! -bar FoldView call FoldView()

" start autocmd section
if has("autocmd")
  au!

  " vimrc source on write
  augroup vimrc
    au!
    autocmd bufwritepost .vimrc source $MYVIMRC
  augroup END

  augroup html
    au!
    autocmd FileType html setl textwidth=0 nowrap
  augroup END

  " remove trailing whitespace
  augroup whitespace
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END

  au FileType binary autocmd! whitespace BufWritePre

  " text and mail
  augroup text_and_mail
    au!
    au FileType mail,gitcommit setl tw=68 list wrap formatoptions
          \ formatoptions+=an
    " au FileType qf silent unmap <buffer> <CR>
    au FileType mail,gitcommit echo "'textwidth' set to" &textwidth
    au BufRead *.txt setl tw=78
  augroup END

  augroup data
    au!
    au FileType xml,xsd,xslt setl ai et sw=2 sts=2 ts=2
    " rss as xml
    au BufReadPost *.rss set ft=xml
    au BufReadPost *.yml setl expandtab
    au BufReadPost *.yml echo "'expandtab' option is set to" &expandtab
  augroup END

  augroup c_like
    au!
    au FileType cpp,c,cs,java setl ai et sta sw=4 sts=4 cin
  augroup END

  augroup ft_css
    au!
    au FileType less,css setl foldmethod=marker foldmarker={,}
          \ omnifunc=csscomplete#CompleteCSS
  augroup END

  augroup ft_php
    au!
    au FileType php,vb setl ai et sta sw=4 sts=4
    " indent all 'print <br />' so I can ignore them while
    " debugging in PHP
    au FileType php nnoremap <buffer> <localleader>bi
          \ :%s/^\(print "<br \/>;\?"\)/    \1/g<CR>
    " sql color
    au FileType php nnoremap <buffer> <localleader>sc
          \ :call PHP_sql_color_on()<CR>
    " sql uncolor
    au FileType php nnoremap <buffer> <localleader>su
          \ :call PHP_sql_color_off()<CR>
    " highlight SQL in strings
    au FileType php set makeprg=php\ -l\ %
    au BufRead php.ini-* set ft=dosini
    au BufNewFile,BufRead /var/www/*.module  set ft=php
  augroup END

  augroup ft_ruby
    au!
    au BufRead,BufNewFile Gemfile*,*.ru,Vagrantfile set ft=ruby
    au FileType ruby,eruby,rails setl keywordprg=ri omnifunc=rubycomplete#Complete |
          \ let g:rubycomplete_rails = 1 |
          \ let g:rubycomplete_buffer_loading = 1 |
          \ let g:rubycomplete_classes_in_global = 1
    set iskeyword+=?
  augroup END

  augroup ft_js
    au!
    au FileType javascript setl ai et sta sw=2 sts=2
  augroup END

  augroup ft_c
    au!
    au FileType c nnoremap <leader>ma :make %:r<CR>
  augroup END

  augroup ft_perl
    au!
    au FileType perl silent! compiler perl
  augroup END

  augroup ft_python
    au!
    au FileType python setl ts=4 sw=4 expandtab
  augroup END

  augroup ft_vim
    au!
    au FileType vim setl keywordprg=:help foldmethod=marker
  augroup END

  augroup ft_snippets
    au!
    au BufReadPost *.snippets setl expandtab
    au BufReadPost *.snippets echo "'expandtab' option is set to" &expandtab
  augroup END

  augroup ft_make
    au!
    au BufReadPost *.make setl noexpandtab ts=8 sts=8 sw=8
    au BufReadPost *.make echo "'expandtab' option is set to" &expandtab
  augroup END

  augroup riml
    au!
    au BufEnter *.riml set syntax=riml
  augroup END

  " last cursor position in buffer
  augroup cursor_pos
    au!
    au BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
  augroup END

  au VimEnter * set lines=38 columns=92
  au VimEnter * winpos 618 24

  if has("gui_running")
    " GUI is running or is about to start.
    " Set gvim window size and position.
    au GUIEnter * set noicon guioptions-=T
    au GUIEnter * if has("diff") && &diff | set columns=165 | endif
  endif

endif
" /autocmds

" Keep at end of file.
syntax enable

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
