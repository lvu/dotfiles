set nocompatible

" Vundle
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'klen/python-mode'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'Shougo/neocomplete.vim'
Plugin 'davidhalter/jedi-vim'
call vundle#end()
filetype plugin indent on     " required! 

set backup
set hidden
set spell spelllang=en_us
set expandtab
set shiftwidth=4
colorscheme peachpuff

if &t_Co > 2 || has("gui_running")
	set hlsearch
endif

hi clear SpellBad
hi clear SpellLocal
hi clear SpellRare
hi SpellBad cterm=inverse
hi SpellLocal cterm=italic
hi SpellRare cterm=underline

nmap <F5> <Esc>:BufExplorer<cr>

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2

let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']
let g:pymode_lint_onfly = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_ignore = "D101,D102,D103,D205,D400,E731"
let g:pymode_options_max_line_length = 79
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope = 0
autocmd FileType python set nonumber

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_fuzzy_completion = 0

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

set foldlevelstart=20
