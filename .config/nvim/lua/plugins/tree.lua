require('nvim-tree').setup({
    filters = {
        dotfiles = false
    },
    diagnostics = {
        enable = true
    },
    renderer = {
        highlight_git = 'name',
        highlight_diagnostics = 'name',
        icons = {
            show = {
                git = false,
                file = false,
                folder = false,
                folder_arrow = false,
                diagnostics = false
            }
        }
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
})

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd('QuitPre', {
    callback = function()
        vim.cmd('NvimTreeClose')
    end
})
