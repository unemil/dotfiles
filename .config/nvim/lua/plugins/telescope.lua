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

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
