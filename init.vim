set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
let g:python_host_prog = '/Users/vlavrinenko/.virtualenvs/nvim2/bin/python'
let g:python3_host_prog = '/Users/vlavrinenko/.virtualenvs/nvim3/bin/python'

" Required:
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('davidhalter/jedi-vim')
	call dein#add('zchee/deoplete-jedi')
	call dein#add('kien/ctrlp.vim')
	call dein#add('hynek/vim-python-pep8-indent')
	call dein#add('jlanzarotta/bufexplorer')
	call dein#add('mileszs/ack.vim')
	" call dein#add('scrooloose/syntastic')
	call dein#add('neomake/neomake')
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-sensible')
	call dein#add('tpope/vim-surround')
	call dein#add('trusktr/seti.vim')
	call dein#add('altercation/vim-colors-solarized')
	call dein#add('Lokaltog/vim-distinguished')
	call dein#add('pangloss/vim-javascript')
	call dein#add('fatih/vim-go')
        call dein#add('zchee/deoplete-go', {'build': 'make'})

  " Required:
  call dein#end()
  call dein#save_state()
endif

set backup
set hidden
set spell spelllang=en_us
set expandtab
set shiftwidth=4
set hlsearch

nmap <leader>b <Esc>:BufExplorer<cr>

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2

autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab

autocmd FileType python setlocal colorcolumn=80

let g:deoplete#enable_at_startup = 1

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#goto_command = "gd"

call neomake#configure#automake('w')
let g:neomake_python_enabled_makers = ['flake8', 'python']
let g:neomake_open_list = 2

set foldlevelstart=20

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

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
