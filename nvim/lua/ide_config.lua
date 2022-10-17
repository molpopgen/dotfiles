require("mason").setup {}
require('mason-lspconfig').setup({
    ensure_installed = {"rust-analyzer", "python-lsp-server", "clangd", "r-languageserver"}
})

require "lsp_signature".setup({})
require 'nvim-web-devicons'.setup { default = true; }
require('lualine').setup()

require('python_lsp')
require('clangd_lsp')
require('r_lsp')
require('rust_lsp')
require('nvim_cmp')

