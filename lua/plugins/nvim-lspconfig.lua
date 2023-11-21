return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            eslint = {},
        },
        setup = {
            eslint = function()
                require("lazyvim.util").lsp.on_attach(function(client)
                    client.server_capabilities.documentFormattingProvider = true

                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function()
                            require("lazyvim.util").lsp.formatting_sync()
                        end,
                    })
                end)
            end,
        },
    },
}
