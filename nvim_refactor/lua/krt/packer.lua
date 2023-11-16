vim.api.nvim_command('packadd packer.nvim')

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- use('nvim-treesitter/playground')
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }

    -- use('theprimeagen/harpoon')
    -- use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        "windwp/nvim-autopairs",
    }

    -- LSP Support
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'simrat39/rust-tools.nvim' }
    -- Autocompletion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    -- use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }

    -- snippets
    use { 'L3MON4D3/LuaSnip' }

    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     requires = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },

    --         -- specific language support

    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-buffer' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lua' },

    --         -- Snippets
    --         { 'L3MON4D3/LuaSnip' },
    --         { 'rafamadriz/friendly-snippets' },
    --     }
    -- }
    use { 'vim-pandoc/vim-pandoc' }
    use { 'vim-pandoc/vim-pandoc-syntax' }
    use { 'vim-pandoc/vim-rmarkdown' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false }
    }
end)
