local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        mappings = {
            i = {
                ['<Esc>'] = actions.close,
                ['<Tab>'] = actions.move_selection_next,
                ['<S-Tab>'] = actions.move_selection_previous
            },
            n = {
                ['<Tab>'] = actions.move_selection_next,
                ['<S-Tab>'] = actions.move_selection_previous
            }
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown()
        }
    }
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fk', builtin.keymaps)
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fd', builtin.diagnostics)
vim.keymap.set('n', '<leader><leader>', builtin.buffers)
