se nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))
" ここでプラグインをインストール
"NeoBundle "git://github.com/vim-scripts/hybrid.vim.git"
filetype plugin indent on


set number
set cursorline
set list
set listchars=tab:▸\ 
set tabstop=2
set shiftwidth=2
set scrolloff=20
let mapleader=','

noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <Down> gj
noremap <Up> gk
noremap <Leader>ev :tabnew $HOME/.vimrc<CR>
noremap <Leader>rv :source $HOME/.vimrc<CR>
vnoremap > >gv
vnoremap < <gv
