set encoding=utf-8
set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))
" ここでプラグインをインストール
NeoBundle "https://github.com/vim-scripts/hybrid.vim.git"
NeoBundle "https://github.com/mattn/zencoding-vim.git"
NeoBundle "VimClojure"
NeoBundle "https://github.com/Lokaltog/vim-powerline.git"
NeoBundle "https://github.com/tpope/vim-surround.git"
NeoBundle "https://github.com/altercation/vim-colors-solarized.git"
" EasyMotion <Leader><Leader>w で発動
NeoBundle "https://github.com/Lokaltog/vim-easymotion.git"
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
	\ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle "https://github.com/h1mesuke/unite-outline.git"
NeoBundle 'thinca/vim-quickrun'
NeoBundle "https://github.com/pangloss/vim-javascript.git"
NeoBundle "https://github.com/helino/vim-json.git"
NeoBundle "https://github.com/scrooloose/syntastic.git"
NeoBundle 'itchyny/calendar.vim'
" .gitとかがあるプロジェクトルートにcdしてくれる <Leader>cdで発動
NeoBundle 'https://github.com/airblade/vim-rooter.git'
" ファイルのツリー表示
NeoBundle 'scrooloose/nerdtree'
" gitプラグイン
NeoBundle 'tpope/vim-fugitive'
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" コメントON/OFFを手軽に実行 行選択してCtrl+-を二回押しで複数行コメントアウト
NeoBundle 'tomtom/tcomment_vim'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
filetype plugin indent on
" Evernoteの編集をできるようにする
NeoBundle 'kakkyz81/evervim'


set number
set cursorline
"set list
"set listchars=tab:▸\ 
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab
set smartindent
set scrolloff=20
set nobackup
let mapleader=','

noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <Down> gj
noremap <Up> gk
noremap <Leader>ev :tabnew $HOME/.vimrc<CR>
noremap <Leader>eg :tabnew $HOME/.gvimrc<CR>
noremap <Leader>rv :source $HOME/.vimrc<CR>
noremap <Leader>rg :source $HOME/.gvimrc<CR>
vnoremap > >gv
vnoremap < <gv
nnoremap <silent> <Leader>q :<C-u>QuickRun<CR>
nnoremap [unite] <Nop>
nmap <Leader>f [unite]
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>

"RSpec対応
let g:quickrun_config = {}
let g:quickrun_config._ = {
	\ 'runner' : 'vimproc',
	\ 'runner/vimproc/updatetime' : 100
\}

"Calender.vim 設定
let g:calendar_views = [ 'year', 'month', 'clock' ]

" localのvimrc読み込み
let s:vimrc_local = "~/.vimrc.local"
if filereadable(expand(s:vimrc_local))
	exec ":source ".s:vimrc_local
	nnoremap <Leader>elv :<C-u>tabnew ~/.vimrc.local<CR>
endif
