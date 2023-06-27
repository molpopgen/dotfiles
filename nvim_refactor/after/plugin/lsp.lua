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

require("mason").setup()
require("mason-lspconfig").setup(
    { ensure_installed = { 'clangd', 'lua_ls', 'pylsp', 'r_language_server', 'rust_analyzer' } }
)

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").r_language_server.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").pylsp.setup {}

set_lsp_keymappings()

local rust_tools = require("rust-tools")
rust_tools.setup {
    server = {
        on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
                cargo = {
                    features = "all"
                },
            }
        },
        tools = {
            -- rust-tools options
            autoSetHints = true,
            hover_with_actions = true,
            inlay_hints = {
                -- Only show inlay hints for the current line
                only_current_line = false,

                -- Event which triggers a refersh of the inlay hints.
                -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
                -- not that this may cause  higher CPU usage.
                -- This option is only respected when only_current_line and
                -- autoSetHints both are true.
                only_current_line_autocmd = "CursorHold",

                -- wheter to show parameter hints with the inlay hints or not
                show_parameter_hints = true,

                -- whether to show variable name before type hints with the inlay hints or not
                show_variable_name = true,

                -- prefix for parameter hints
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                other_hints_prefix = "=> ",

                -- whether to align to the length of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "Comment",
            },
        },
    }
}
