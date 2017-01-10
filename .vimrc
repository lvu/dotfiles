set nocompatible

" Vundle
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'klen/python-mode'
Plugin 'Shougo/neocomplete.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'gmarik/Vundle.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'trusktr/seti.vim'
call vundle#end()
filetype plugin indent on     " required! 

set backup
set hidden
set spell spelllang=en_us
set expandtab
set shiftwidth=4
set hlsearch

nmap <F5> <Esc>:BufExplorer<cr>

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
autocmd FileType python setlocal colorcolumn=80

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

colorscheme seti

fun! s:highlight()
    hi clear SpellBad
    hi clear SpellLocal
    hi clear SpellRare
    hi SpellBad ctermbg=53
    hi SpellLocal ctermbg=53 cterm=underline
    hi SpellRare ctermbg=89
endfun

augroup myplugin_highlight
    autocmd!
    autocmd ColorScheme * call s:highlight()
augroup end
call s:highlight()
