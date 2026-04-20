return {
    cmd = {'pylsp'},
    filetypes = { 'python' },
    settings = {
        pylsp = {
            plugins = {
                pyls_black = { enabled = true },
                isort = { enabled = true, profile = "black" },
            },
        },
    }
}
