return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
        "hrsh7th/nvim-cmp",
        {"williamboman/mason.nvim", opts = {}},
        "neovim/nvim-lspconfig",
        {
            "VonHeikemen/lsp-zero.nvim",
            config = function(plugin)
                local lsp_zero = require("lsp-zero")
                lsp_zero.on_attach(function(client, bufnr)
                    lsp_zero.default_keymaps({buffer = bufnr})
                end)
                local cmp = require("cmp")
                cmp.setup({
                    mapping = cmp.mapping.preset.insert({
                        ['<CR>'] = cmp.mapping.confirm({select = false}),
                    })
                })
            end,
        }
    },
    opts = {
        handlers = {
            function (name)
                require('lsp-zero').default_setup(name)
            end,
        },
    },
}
