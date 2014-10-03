colorscheme hybrid

"only MacVim setting
if has('gui_macvim')
endif
"
" localのgvimrc読み込み
let s:gvimrc_local = "~/.gvimrc.local"
if filereadable(expand(s:gvimrc_local))
	exec ":source ".s:gvimrc_local
	nnoremap <Leader>elg :<C-u>tabnew ~/.gvimrc.local<CR>
endif
