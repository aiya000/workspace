"---------------------------------------------------------
" 基本設定
"---------------------------------------------------------

" 起動時メッセージを表示しない
set shortmess& shortmess+=I
"エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell

" 自動コマンド削除
autocmd!

" Vundleの設定を読み込む
if filereadable(expand('~/.vim/bundles.vim'))
    source ~/.vim/bundles.vim
endif

set nocompatible

set fileencodings=utf-8,cp932

" シンタックス有効
syntax on

" ファイルタイプ判定ON
filetype plugin indent on

" Ev/Rvでvimrcの編集と反映
command! Ev edit ~/dotfiles/.vimrc
command! Rv source ~/dotfiles/.vimrc

" Eg/Rgでgvimrcの編集と反映
command! Eg edit ~/dotfiles/.gvimrc
command! Rg source ~/dotfiles/.gvimrc

" Eb/RbでNeoBundleの編集と反映
command! Eb edit ~/dotfiles/.vim/bundles.vim
command! -bang Rb :Unite neobundle/install:<bang>

" 一時ファイル
command! Tmp edit ~/Dropbox/tmp.txt
command! Temp edit ~/Dropbox/tmp.txt

nnoremap C-q VimFiler -split -simple -winwidth=35 -no-quit
"変更されたときに自動読み込み
set autoread

" カーソルを中央行に
set scrolloff=999

" <Leader>を,に
let mapleader = ","

" モードラインを無効にする
set nomodeline
set modelines=0

" 行数を表示
set number

" バックアップはとらない
set nobackup
set noswapfile
set directory=~/.vim/swp

" バックスペースで何でも消せるように
set backspace=indent,eol,start

" ペアとなる括弧の定義
set matchpairs+=<:>

" undoを記録
" set undofile

" 編集中もほかファイルを開けるように
set hidden

" koriya版に同梱されているプラグインを無効化する
let plugin_dicwin_disable = 1

"---------------------------------------------------------
" コマンドライン
"---------------------------------------------------------

set cmdheight=2            " コマンドラインは２行
set showcmd                " コマンドを表示
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加



" release autogroup in MyAutoCmd
augroup MyAutoCmd
   autocmd!
augroup END

source ~/dotfiles/vimrc/statusline.vimrc
source ~/dotfiles/vimrc/indent.vimrc
source ~/dotfiles/vimrc/cursor.vimrc
source ~/dotfiles/vimrc/encoding.vimrc
source ~/dotfiles/vimrc/search.vimrc
source ~/dotfiles/vimrc/keymap.vimrc
source ~/dotfiles/vimrc/plugin_config.vimrc
source ~/dotfiles/vimrc/filer.vimrc
source ~/dotfiles/vimrc/others.vimrc

if has("gui_running")
    " gvimrcも読み込む
    source ~/dotfiles/.gvimrc
else
    " CUI版Vim用のコード
    set background=dark
    colorscheme mrkn256
endif
