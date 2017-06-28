set encoding=utf-8
set nocompatible
filetype off

augroup AutoCommands
    autocmd!
augroup END

if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
endif
if dein#load_state(expand('~/.vim/bundle/'))
    call dein#begin(expand('~/.vim/bundle/'))

    call dein#load_toml(expand('~/.vim/plugins.toml'), {'lazy':0})

    call dein#end()
    call dein#save_state()
endif
filetype plugin indent on
syntax enable


set number
set cursorline
set list
set listchars=eol:¬,trail:_,tab:▸\
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab
set smartindent
set scrolloff=20
set nobackup
set t_Co=256
set termguicolors
filetype plugin on
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
nnoremap [unite] <Nop>
nmap <Leader>f [unite]


" localのvimrc読み込み
let s:vimrc_local = "~/.vimrc.local"
if filereadable(expand(s:vimrc_local))
	exec ":source ".s:vimrc_local
	nnoremap <Leader>elv :<C-u>tabnew $HOME/.vimrc.local<CR>
    nnoremap <Leader>rlv :source $HOME/.vinrc.local<CR>
endif
