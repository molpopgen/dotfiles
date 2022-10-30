require('lspconfig').rust_analyzer.setup {}
local rust_tools = require("rust-tools")
rust_tools.setup {
    server = { on_attach = on_attach,
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
    }
}
