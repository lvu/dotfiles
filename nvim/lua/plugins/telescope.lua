return {
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
}
