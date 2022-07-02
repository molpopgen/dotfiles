require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'averms/black-nvim'
    use 'simrat39/rust-tools.nvim'
    use 'williamboman/nvim-lsp-installer'
    -- use 'cocopon/iceberg.vim'
    use 'shaunsingh/nord.nvim'
    use 'tpope/vim-fugitive'
    use 'itchyny/lightline.vim'
    use 'psf/black'
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    use 'vim-pandoc/vim-rmarkdown'
    use 'dense-analysis/ale'
    use 'rhysd/vim-clang-format'
    use 'rykka/riv.vim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'vimwiki/vimwiki'
end)
