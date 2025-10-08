-- vim.api.nvim_command('packadd packer.nvim')

local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not (vim.uv or vim.loop).fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add {
    'tpope/vim-fugitive',

    {
        'nvim-telescope/telescope.nvim', -- tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    },

    {
        'rose-pine/neovim',
        as = 'rose-pine',
    },

    { 'nvim-treesitter/nvim-treesitter',            { run = ':TSUpdate' } },
    -- use('nvim-treesitter/playground')
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },


    {
        "windwp/nvim-autopairs",
    },

    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- { 'simrat39/rust-tools.nvim' },
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- snippets
    { 'L3MON4D3/LuaSnip' },

    -- pandoc
    { 'vim-pandoc/vim-pandoc' },
    { 'vim-pandoc/vim-pandoc-syntax' },
    { 'vim-pandoc/vim-rmarkdown' },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false }
    },
}
