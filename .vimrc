set backup
set hidden
set spell spelllang=en_us
set expandtab
set shiftwidth=4
set hlsearch
set signcolumn=yes

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Plug 'vim-airline/vim-airline'
Plug 'Lokaltog/vim-distinguished'
Plug 'jlanzarotta/bufexplorer'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile; read'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
call plug#end()

nmap <leader>b <Esc>:BufExplorer<cr>

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '^\.']

autocmd FileType python setlocal colorcolumn=80

set foldlevelstart=20

colorscheme distinguished

fun! s:highlight()
    hi clear SpellBad
    hi clear SpellLocal
    hi clear SpellRare
    hi SpellBad ctermbg=53
    hi SpellLocal ctermbg=53 cterm=underline
    hi SpellRare ctermbg=89
endfun

augroup my_highlight
    autocmd!
    autocmd ColorScheme * call s:highlight()
augroup end
call s:highlight()

if filereadable(expand("~/.vim/coc-mappings.vim"))
  source ~/.vim/coc-mappings.vim"
endif
