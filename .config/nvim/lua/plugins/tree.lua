require('nvim-tree').setup({
    filters = {
        dotfiles = false
    },
    diagnostics = {
        enable = true
    },
    renderer = {
        root_folder_label = false,
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
    },
    view = {
        float = {
            enable = true,
            open_win_config = function()
                local screen_width = vim.api.nvim_list_uis()[1].width
                local screen_height = vim.api.nvim_list_uis()[1].height
                local width = 60
                local height = 30

                return {
                    relative = 'editor',
                    border = 'rounded',
                    width = width,
                    height = height,
                    row = (screen_height - height) * 0.5,
                    col = (screen_width - width) * 0.5
                }
            end
        }
    }
})

local api = require('nvim-tree.api')

vim.keymap.set('n', '<leader>n', api.tree.toggle)
