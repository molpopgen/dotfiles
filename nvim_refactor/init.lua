require('krt')

vim.pack.add({
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/nvim-lua/plenary.nvim', 
    'https://github.com/nvim-telescope/telescope.nvim',
    {
        src = 'https://github.com/rose-pine/neovim',
        name = 'rose-pine',
    },


    {
        src = "https://github.com/windwp/nvim-autopairs",
    },

    -- LSP Support
    -- { 'neovim/nvim-lspconfig' },
    { src = 'https://github.com/williamboman/mason.nvim' },
    { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
    -- { 'simrat39/rust-tools.nvim' },
    { src = 'https://github.com/mrcjkb/rustaceanvim' },
    -- Autocompletion
    { src = 'https://github.com/hrsh7th/nvim-cmp' },
    { src = 'https://github.com/hrsh7th/cmp-buffer' },
    { src = 'https://github.com/hrsh7th/cmp-path' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lua' },

    -- snippets
    { src = 'https://github.com/L3MON4D3/LuaSnip' },


    -- lualine
    {
        src = 'https://github.com/nvim-lualine/lualine.nvim',
        requires = { 'https://github.com/kyazdani42/nvim-web-devicons', opt = false }
    },
})

enable_lsps = function()
    vim.lsp.enable('pylsp')
    vim.lsp.enable('clangd')
    -- NOPE: rust-analyzer behaves differently...
    -- vim.lsp.enable('rust-analyzer')
end

set_lsp_keymappings = function()
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", 'gw', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set("n", 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set("n", '<c-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set("n", '<F6>', ":lua vim.lsp.buf.format{async=true}<cr>")
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
end

set_lsp_keymappings()
enable_lsps()
