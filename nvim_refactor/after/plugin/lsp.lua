set_lsp_keymappings = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", 'gw', vim.lsp.buf.document_symbol, opts)
    vim.keymap.set("n", 'gw', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set("n", 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set("n", '<c-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", '<leader>af', vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set("n", '<F6>', ":lua vim.lsp.buf.format{async=true}<cr>")

    -- from The Primeagen
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    -- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
end

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'pylsp',
    'rust_analyzer',
    'clangd',
    'r_language_server'
})

lsp.skip_server_setup({ 'rust_analyzer' })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- For this all to work:
-- pip install python-lsp-black
-- after intalling the Lsp and
-- then activating its venv.
-- To find the lsp location:
-- ps ax | grep lsp while nvim is running.
-- require('lspconfig').pylsp.setup {
--     filetypes = { "python" },
--     settings = {
--         configurationSources = { "flake8" },
--         formatCommand = { "black" },
--         pylsp = {
--             plugins = {
--                 black = { enabled = true },
--                 isort = { enabled = true },
--             }
--         }
--     },
-- }

lsp.on_attach(function(client, bufnr)
    set_lsp_keymappings(client, bufnr)
end)

lsp.setup()

vim.diagnostic.config({
    -- virtual_text is the floaty words on the side,
    -- but they aren't showing up for all languages
    -- They are also distracting for many languages.
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = true,
})

require('rust-tools').setup({
    server = {
        on_attach = function(client, bufnr)
            -- NOTE: this is hacky!
            -- As per the lsp-zero README, we disable rust_analyzer config
            -- above.
            -- However, doing so means that we need to manually set our
            -- keymappings for this tool
            set_lsp_keymappings(client, bufnr)
        end,
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
        }
    },
})
