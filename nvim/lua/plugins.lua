require("lazy").setup({
	{
		"Lokaltog/vim-distinguished",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme distinguished]])
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{"<C-n>", "<cmd>Neotree toggle<cr>"},
		},
	},	
	"tpope/vim-fugitive",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{"<leader>g", "<cmd>Telescope grep_string<cr>"},
			{"<leader>l", "<cmd>Telescope live_grep<cr>"},
			{"<leader>b", "<cmd>Telescope buffers<cr>"},
			{"<leader>h", "<cmd>Telescope help_tags<cr>"},
			{"<leader>c", "<cmd>Telescope commands<cr>"},
			{"<leader>t", "<cmd>Telescope builtin<cr>"},
		},
		opts = { pickers = { buffers = { mappings = { i = {
			["<c-d>"] = "delete_buffer",
		} } } } },
	},

	-- LSP
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			handlers = {
				function (name)
					require('lsp-zero').default_setup(name)
				end,
			},
		},
		dependencies = {
			{"williamboman/mason.nvim", opts = {}},
			"neovim/nvim-lspconfig",
			{
				"VonHeikemen/lsp-zero.nvim",
				config = function(plugin)
					lsp_zero = require("lsp-zero")
					lsp_zero.on_attach(function(client, bufnr)
						lsp_zero.default_keymaps({buffer = bufnr})
					end)
				end,
			}
		},
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	},
})
