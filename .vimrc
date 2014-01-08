set encoding=utf-8
set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))
" ここでプラグインをインストール
NeoBundle "https://github.com/vim-scripts/hybrid.vim.git"
" Zencoding Ctrl-y , で発動
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
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle "https://github.com/h1mesuke/unite-outline.git"
NeoBundle 'thinca/vim-quickrun'
NeoBundle "https://github.com/pangloss/vim-javascript.git"
NeoBundle "https://github.com/helino/vim-json.git"
NeoBundle "https://github.com/scrooloose/syntastic.git"
NeoBundle "https://github.com/cocopon/iceberg.vim.git"
filetype plugin indent on


set number
set cursorline
"set list
"set listchars=tab:▸\ 
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent
set scrolloff=20
set nobackup
let mapleader=','
let g:quickun_config={'_' : {'runner' : 'vimproc'}}

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
nnoremap [unite] <Nop>
nmap <Leader>f [unite]
