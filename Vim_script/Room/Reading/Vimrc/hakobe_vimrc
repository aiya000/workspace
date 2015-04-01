
" vim:set foldmethod=marker:
"

" NeoBundle {{{
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'vim-scripts/pyte'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bling/vim-airline'
NeoBundle 'jceb/vim-hier'
NeoBundle 'dannyob/quickfixstatus'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle 'majutsushi/tagbar'

NeoBundle "motemen/vim-guess-abbrev"
NeoBundle 'godlygeek/tabular'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'gcmt/wildfire.vim'
NeoBundle "syui/airsave.vim"
NeoBundle "gre/play2vim"
NeoBundle 'kien/rainbow_parentheses.vim'

NeoBundle 'mileszs/ack.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'vim-perl/vim-perl'
NeoBundle 'hakobe/vim-scala'
NeoBundle 'nginx.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'vim-jp/vim-go-extra'
" vim-ft-goは最新版のvimを使えない場合のみ
" NeoBundle 'google/vim-ft-go'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'clausreinke/typescript-tools'

NeoBundle 'motemen/vim-help-random'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'sgur/unite-qf'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'hakobe/unite-script-examples'

filetype plugin indent on " Required for NeoBundle

" }}}

" Other Plugin Loading {{{
if $GOROOT != ''
    set rtp+=$GOROOT/misc/vim
endif

" }}}

" Basic Configuration {{{

set nocompatible
set backspace=indent,eol,start

set nobackup
set viminfo=!,'50,<1000,s100,\"50 "
set history=100 
set ruler

" 補完時に無視されるファイル名のsuffix
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

syntax on

" 色の設定
set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm

set background=dark
colorscheme hybrid

" 補完候補の色づけ
hi Pmenu ctermfg=Black
hi Pmenu ctermbg=Gray
hi PmenuSel ctermfg=Black
hi PmenuSel ctermbg=Cyan
hi PmenuSbar ctermfg=White
hi PmenuSbar ctermbg=DarkGray

set number

set modelines=1

" タブ幅の設定
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

"インデントの設定
set autoindent
set smartindent
set cindent

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

"検索時に最後まで行ったら最初に戻る
set wrapscan

"検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

"入力中のコマンドをステータスに表示する
set showcmd

"括弧入力時の対応する括弧を表示
set showmatch

"検索結果文字列のハイライトを有効にする
set hlsearch

"ステータスラインを常に表示
set laststatus=2

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

" コマンドライン補間をシェルっぽく
set wildmode=list:longest

" バッファが編集中でもその他のファイルを開けるように
set hidden

" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread

" Whitespaceを表示
set listchars=tab:>-,trail:_
set list

" undoの設定
set undofile
set undodir=/Users/yohei/.vim/undodir/

" 文字コード
set encoding=utf-8
" fileencoding については自動認識してもらう
" see https://code.google.com/p/macvim-kaoriya/wiki/Readme#文字コード判別

" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" set tags
set tags=tags,./tags

" 辞書ファイルからの単語補間
set complete+=k
" }}}

" Auto Command {{{

autocmd BufEnter */hatena/Hatena-*.html setlocal ft=tt2html
autocmd BufEnter *.tt            setlocal ft=tt2html
autocmd BufEnter *.psgi          setlocal ft=perl
autocmd BufEnter *.t             setlocal ft=perl

" }}}

" Commands {{{

let mapleader = ","

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

noremap <unique> <silent> <Leader>n :bn<CR>
noremap <unique> <silent> <Leader>p :bp<CR>
noremap <unique> <silent> <Leader>d :bd<CR>

nnoremap <unique> <Leader>] :vertical stag <C-R>=expand('<cword>')<CR><CR>
nnoremap <unique> <Leader>g] :vertical stselect <C-R>=expand('<cword>')<CR><CR>

noremap <unique> <Leader>wu :pedit +0<CR>:wincmd P<CR>

"" commentout {{{

" lhs comments
vnoremap <unique> <silent> ,# :s/^/#/<CR>:nohlsearch<CR>
vnoremap <unique> <silent> ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vnoremap <unique> <silent> ," :s/^/\"/<CR>:nohlsearch<CR>
vnoremap <unique> <silent> ,% :s/^/%/<CR>:nohlsearch<CR>
vnoremap <unique> <silent> ,; :s/^/;/<CR>:nohlsearch<CR>
vnoremap <unique> <silent> ,- :s/^/--/<CR>:nohlsearch<CR>
vnoremap <unique> <silent> ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

"" }}}

"" Macのクリップボードをペースト {{{
nnoremap <unique> <silent> <Leader>v "*p
vnoremap <unique> <silent> <Leader>v "*p
nnoremap <unique> <silent> <Leader>y "*y
vnoremap <unique> <silent> <Leader>y "*y
" }}}

" }}}

" Plugin Setting {{{

"" unite {{{
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_source_file_rec_max_cache_files = 100000

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  " ESCキーを2回押すと終了する
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

nnoremap <SID>[unite] <Nop>
nmap <Space> <SID>[unite]

nnoremap <silent> <SID>[unite]; :<C-u>Unite buffer file_mru file file/new -buffer-name=files -start-insert<CR>
nnoremap <silent> <SID>[unite]' :<C-u>UniteWithBufferDir buffer file_mru file file/new -buffer-name=files -start-insert<CR>
nnoremap <silent> <SID>[unite]f :<C-u>Unite file file/new -buffer-name=files -start-insert<CR>
nnoremap <silent> <SID>[unite]F :<C-u>UniteWithBufferDir file file/new -buffer-name=files -start-insert<CR>
nnoremap <silent> <SID>[unite]r :<C-u>Unite file file_rec:lib file_rec:t file_rec:templates file_rec:script file_rec:static file_rec:config file_rec:src -buffer-name=files -start-insert<CR>
nnoremap <silent> <SID>[unite]b :<C-u>Unite buffer -immediately -start-insert<CR>
nnoremap <silent> <SID>[unite]B :<C-u>Unite buffer -immediately -start-insert<CR>
nnoremap <silent> <SID>[unite]w :<C-u>Unite window:no-current<CR>
nnoremap <silent> <SID>[unite]p :<C-u>Unite history/yank -buffer-name=register -no-split<CR>
nnoremap <silent> <SID>[unite]l :<C-u>Unite line -buffer-name=search -start-insert<CR>
nnoremap <silent> <SID>[unite]d :<C-u>Unite outline -vertical -hide-source-names -winwidth=40 -buffer-name=outline<CR>
nnoremap <silent> <SID>[unite]: :<C-u>Unite history/command -start-insert<CR>
nnoremap <silent> <SID>[unite]. :<C-u>Unite source<CR>
nnoremap <silent> <SID>[unite]t :<C-u>Unite tag<CR>
nnoremap <silent> <SID>[unite]q :<C-u>Unite qf -no-quit -no-empty -auto-resize -buffer-name=quickfix<CR>
nnoremap <silent> <SID>[unite]G :<C-u>Unite grep:. -buffer-name=search -start-insert<CR>
nnoremap <silent> <SID>[unite]g :<C-u>UniteWithCursorWord grep:. -buffer-name=search -start-insert<CR>
nnoremap <silent> <SID>[unite]c :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent> <SID>[unite]h :<C-u>Unite help -auto-preview<CR>
nnoremap <silent> <expr> <SID>[unite]i ':<C-u>Unite script:perl:examples/itunes.pl -start-insert<CR>'
nnoremap <silent> <expr> <SID>[unite]I ':<C-u>Unite script:ruby:examples/github-notify.rb -start-insert<CR>'
"" }}}

"" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
"}}}

"" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
"" }}}

"" go {{{
"" go get code.google.com/p/go.tools/cmd/goimports
let g:gofmt_command = 'goimports'
let g:godef_split = 3
let g:godef_same_file_in_same_window = 1
"" }}}

"" neocomplete {{{

let g:neocomplete#enable_at_startup = 1
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns = {}
endif
let g:neocomplete#delimiter_patterns['perl'] = []

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = ""

"" }}}

"" neosnippet {{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory = "~/.vim/snippets"

"" }}}

"" vim-hier {{{
let g:hier_enabled = 1
"" }}}

"" quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config['watchdogs_checker/_'] = {
      \   'outputter/quickfix/open_cmd' : '',
      \   'hook/hier_update/enable_exit' : 1,
      \   'runner/vimproc/updatetime' : 40,
      \ }

"" }}}

"" watchdog {{{
let g:watchdogs_check_BufWritePost_enable = 1
let g:quickrun_config['watchdogs_checker/perl-projectlibs'] = {
      \   'command' : '~/.vim/tools/efm_perl.pl',
      \   'exec' : '%c %o %s:p',
      \   'quickfix/errorformat' : '%f:%l:%m',
      \ }
let g:quickrun_config['perl/watchdogs_checker'] = {
      \   'type' : 'watchdogs_checker/perl-projectlibs',
      \ }
let g:quickrun_config['scala/watchdogs_checker'] = {
      \   'type' : '',
      \ }

"" }}}

"" fugitive {{{

noremap <unique> <Leader>gs :<C-u>Gstatus<CR>
noremap <unique> <Leader>gd :<C-u>Gdiff<CR>
noremap <unique> <Leader>gb :<C-u>Gblame<CR>
noremap <unique> <Leader>ga :<C-u>Gwrite<CR>
noremap <unique> <Leader>gc :<C-u>Gcommit -v<CR>
noremap <unique> <silent> <Leader>gg :<C-u>Gcd .<CR>

"" }}}

"" tagbar {{{

noremap <unique> <Leader>]] :<C-u>TagbarToggle<CR>

" see https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"" }}}

"" undotree {{{

nnoremap <unique> <silent> <Leader>u :<C-u>UndotreeToggle<CR>

" }}}

"" tabular {{{

vnoremap <unique> <Leader>t :Tabularize /

" }}}

"" wildfire {{{

let g:wildfire_objects = ["iw", "i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" }}}

"" air-save {{{

let g:auto_write = 1

"" }}}

"" rainbow_parentheses {{{

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

"" }}}

" }}}
