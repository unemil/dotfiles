local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'nvim-lua/plenary.nvim',
    'tpope/vim-sleuth',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    {
        'mellow-theme/mellow.nvim',
        config = function()
            vim.cmd('colorscheme mellow')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.lualine')
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('plugins.tree')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',

                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end
            },
            { 'nvim-telescope/telescope-ui-select.nvim' }
        },
        config = function()
            require('plugins.telescope')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        },
        config = function()
            require('plugins.lsp')
        end
    },
    {
        'windwp/nvim-autopairs',
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require('plugins.autopairs')
        end
    }
})
