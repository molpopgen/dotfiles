-- For this all to work:
-- pip install python-lsp-black
-- after intalling the Lsp and
-- then activating its venv.
-- To find the lsp location:
-- ps ax | grep lsp while nvim is running.
require('lspconfig').pylsp.setup{
    filetypes = {"python"},
    settings = {
        configurationSources = {"flake8"},
        formatCommand = {"black"},
        pylsp = {
            plugins = {
                black = { enabled = true },
                isort = { enabled = true },
            }
        }
    },
}

