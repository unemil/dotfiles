require('nvim-tree').setup({
    filters = {
        dotfiles = false
    },
    renderer = {
        icons = {
            show = {
                git = false,
                file = false,
                folder = false,
                folder_arrow = false
            }
        }
    }
})

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd('QuitPre', {
    callback = function()
        vim.cmd('NvimTreeClose')
    end
})
