require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical'
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        }
    }
})

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sh', builtin.help_tags)
vim.keymap.set('n', '<leader>sk', builtin.keymaps)
vim.keymap.set('n', '<leader>sf', builtin.find_files)
vim.keymap.set('n', '<leader>sg', builtin.live_grep)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
vim.keymap.set('n', '<leader><leader>', builtin.buffers)
