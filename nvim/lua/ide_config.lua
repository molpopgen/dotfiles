require("mason").setup {}
require('mason-lspconfig').setup({
    ensure_installed = { "rust_analyzer",
        "sumneko_lua", "pylsp", "clangd", "r_language_server" }
})

require "lsp_signature".setup({})
require 'nvim-web-devicons'.setup { default = true; }
require('lualine').setup()

require('python_lsp')
require('clangd_lsp')
require('r_lsp')
require('rust_lsp')
require('nvim_cmp')

-- some lazy stuff goes here that we don't think
-- we'll need to config more later
require('lspconfig').sumneko_lua.setup {}
