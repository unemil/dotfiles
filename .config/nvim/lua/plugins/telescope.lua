require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical'
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
})

vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
