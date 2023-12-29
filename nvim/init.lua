vim.keymap.set('n', '<C-Right>', '<c-w>l', {desc = 'Window right'})
vim.keymap.set('n', '<C-Left>', '<c-w>h', {desc = 'Window left'})
vim.keymap.set('n', '<C-Up>', '<c-w>k', {desc = 'Window up'})
vim.keymap.set('n', '<C-Down>', '<c-w>j', {desc = 'Window down'})

vim.keymap.set('t', '<Esc>', '<c-\\><c-n>', {desc = 'Window down'})

vim.opt.mouse = ""
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.diagnostic.config({
    update_in_insert = false,
    virtual_text = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- Show line diagnostics automatically in hover window
vim.cmd([[
autocmd! CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
]])

require('plugins.lazy').setup({
    "tpope/vim-fugitive",
    require('plugins.colorscheme'),
    require('plugins.tree'),
    require('plugins.telescope'),
    require('plugins.autocomplete'),
    require('plugins.lsp'),
})
