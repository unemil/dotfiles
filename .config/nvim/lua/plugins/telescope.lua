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

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
