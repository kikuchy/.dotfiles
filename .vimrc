set encoding=utf-8
set nocompatible
filetype off
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
endif
call dein#begin(expand('~/.vim/bundle/'))

" Plugins and its settings
call dein#add("https://github.com/vim-scripts/hybrid.vim.git")
" zen-codingの後継。insert modeのとき <C-y>, で発動
" <C-y>nで未入力箇所を移動
call dein#add("mattn/emmet-vim")
call dein#add("VimClojure")
call dein#add("https://github.com/tpope/vim-surround.git")
call dein#add("https://github.com/altercation/vim-colors-solarized.git")
" EasyMotion <Leader><Leader>w で発動
call dein#add("https://github.com/Lokaltog/vim-easymotion.git")
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc', {'build': 'make'})
call dein#add("https://github.com/h1mesuke/unite-outline.git")
call dein#add('thinca/vim-quickrun')
call dein#add("https://github.com/pangloss/vim-javascript.git")
call dein#add("https://github.com/helino/vim-json.git")
call dein#add("https://github.com/scrooloose/syntastic.git")
" .gitとかがあるプロジェクトルートにcdしてくれる <Leader>cdで発動
call dein#add('https://github.com/airblade/vim-rooter.git')
" ファイルのツリー表示
call dein#add('scrooloose/nerdtree')
" gitプラグイン
call dein#add('tpope/vim-fugitive')
" ステータス行に現在のgitブランチを表示する
"set statusline+=%{fugitive#statusline()}
" コメントON/OFFを手軽に実行 行選択してCtrl+-を二回押しで複数行コメントアウト
call dein#add('tomtom/tcomment_vim')
" インデントに色を付けて見やすくする
call dein#add('nathanaelkane/vim-indent-guides')
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" Evernoteの編集をできるようにする
call dein#add('kakkyz81/evervim')
" オムニ補完
call dein#add('Shougo/neocomplete.vim')
" ステータスライン拡張
call dein#add('itchyny/lightline.vim')
" ctagsのファイル生成
call dein#add('soramugi/auto-ctags.vim')
" CoffeeScript用
call dein#add('kchmck/vim-coffee-script')
" lessシンタックス
call dein#add('groenewege/vim-less')
" Rubyコード補完
call dein#add('marcus/rsense')
call dein#add('Shougo/neocomplcache-rsense.vim')
" 自動でendを付ける
call dein#add('tpope/vim-endwise')
" ReactJS
call dein#add('mxw/vim-jsx')

call dein#end()
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
nnoremap <silent> <Leader>q :<C-u>QuickRun<CR>
nnoremap [unite] <Nop>
nmap <Leader>f [unite]
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>ga :Gwrite<CR>

"RSpec対応
let g:quickrun_config = {}
let g:quickrun_config._ = {
	\ 'runner' : 'vimproc',
	\ 'runner/vimproc/updatetime' : 100
\}

"Calender.vim 設定
let g:calendar_views = [ 'year', 'month', 'clock' ]

" lightline.vim 設定
let g:lightline = {
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['fugitive', 'filename'] ]
      \ },
    \ 'component_function': {
    \   'readonly': 'LLReadonly',
    \   'modified': 'LLModified',
    \   'filename': 'LLFilename',
    \   'fugitive': 'LLFugitive'
    \ },
    \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
\ }
function! LLModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LLReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LLFilename()
  return ('' != LLReadonly() ? LLReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LLModified() ? ' ' . LLModified() : '')
endfunction

function! LLFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        let _ = fugitive#head()
        return strlen(_) && winwidth('.') > 100 ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

" neocomplete.vim 設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" auto-ctagsの設定
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
set tags+=.git/tags

" localのvimrc読み込み
let s:vimrc_local = "~/.vimrc.local"
if filereadable(expand(s:vimrc_local))
	exec ":source ".s:vimrc_local
	nnoremap <Leader>elv :<C-u>tabnew $HOME/.vimrc.local<CR>
    nnoremap <Leader>rlv :source $HOME/.vinrc.local<CR>
endif
