return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = { eslint = {} },
        setup = {
            eslint = function()
                require("lazyvim.util").lsp.on_attach(function(client)
                    client.server_capabilities.documentFormattingProvider = true
                end)
            end,
        },
    },
}
