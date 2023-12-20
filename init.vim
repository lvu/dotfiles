" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/plenary.nvim'       " LUA lib for other plugins
Plug 'Lokaltog/vim-distinguished'  " Color scheme
Plug 'preservim/nerdtree'          " File tree
Plug 'tpope/vim-commentary'        " Commenting blocks
Plug 'tpope/vim-fugitive'          " Git integration
Plug 'nvim-telescope/telescope.nvim'  " Find in files and more
Plug 'chrisbra/csv.vim'            " CSV support

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
" Plug 'github/copilot.vim'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" LSP defaults and autosetup
Plug 'VonHeikemen/lsp-zero.nvim'

" Scala LSP
Plug 'scalameta/nvim-metals'

" DB access
Plug 'tpope/vim-dadbod'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '^\.']

colorscheme distinguished

" Window movement
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Telescope mappings
nnoremap <leader>f <cmd>Telescope git_files<cr>
nnoremap <leader>g <cmd>Telescope grep_string<cr>
nnoremap <leader>l <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>c <cmd>Telescope commands<cr>
nnoremap <leader>t <cmd>Telescope builtin<cr>

" Excape to normal mode in terminal
:tnoremap <Esc> <C-\><C-n>

set mouse=

lua <<EOF

-- Telescope setup
require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  }
}

-- LSP-Zero setup
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

-- Metals setup
local lsp_on_attach = lsp.build_options('metals', {}).on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
local metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}
metals_config.on_attach = lsp_on_attach
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

EOF
