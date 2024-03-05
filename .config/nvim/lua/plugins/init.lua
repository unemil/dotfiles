vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        'tpope/vim-commentary',
        'tpope/vim-fugitive'
    }

    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.lualine')
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('plugins.telescope')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'neovim/nvim-lspconfig',

            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets'
        },
        config = function()
            require('plugins.lsp')
        end
    }

    use {
        'windwp/nvim-autopairs',
        requires = { 'hrsh7th/nvim-cmp' },
        config = function()
            require('plugins.autopairs')
        end
    }
end)
