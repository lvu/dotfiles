set backup
set hidden
set spell spelllang=en_us
set expandtab
set shiftwidth=4
set hlsearch
set signcolumn=yes

nmap <leader>b <Esc>:BufExplorer<cr>

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

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

augroup myplugin_highlight
    autocmd!
    autocmd ColorScheme * call s:highlight()
augroup end
call s:highlight()

if filereadable(expand("~/.vim/coc-mappings.vim"))
  source ~/.vim/coc-mappings.vim"
endif
