return {
    {
        "nvim-neotest/neotest",
        dependencies = { "adrigzr/neotest-mocha" },
        key = {
            {
                "<leader>tl",
                function()
                    require("neotest").run.run_last()
                end,
                desc = "Run Last Test",
            },
        },
        opts = function(_, opts)
            table.insert(
                opts.adapters,
                require("neotest-mocha")({
                    command = "npm test --",
                    env = { CI = true },
                    cwd = function()
                        return vim.fn.getcwd()
                    end,
                })
            )
        end,
    },
}
