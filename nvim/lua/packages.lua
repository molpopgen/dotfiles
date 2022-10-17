require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter',
        config = function()
            local configs = require 'nvim-treesitter.configs'
            configs.setup {
                ensure_installed = { "norg", "python", "rust", "c", "cpp", "latex", "r", "javascript" }, -- make sure we only use maintained parsers
                highlight = {
                    enable = true,
                    custom_captures = {
                        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
                        -- ["foo.bar"] = "Identifier",
                    },
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = false
                }
            }
        end
    }
    use {'nvim-treesitter/nvim-treesitter-context'}
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'simrat39/rust-tools.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use "savq/melange"
    use 'tpope/vim-fugitive'
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    use 'vim-pandoc/vim-rmarkdown'
    use 'dense-analysis/ale'
    use 'rhysd/vim-clang-format'
    use 'rykka/riv.vim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'vimwiki/vimwiki'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false }
    }
    use {
        "ray-x/lsp_signature.nvim",
    }
end)
