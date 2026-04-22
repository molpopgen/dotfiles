require("mason").setup()
require("mason-lspconfig").setup(
    {
        automatic_enable = false,
        ensure_installed = { 'clangd', 'lua_ls', 'pylsp', 'rust_analyzer', 'tinymist' }
    }
)

