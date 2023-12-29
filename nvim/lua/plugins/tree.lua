return {
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
        {"<C-b>", "<cmd>Neotree filesystem reveal<cr>"},
    },
}
