return {
    {
        "zapling/mason-conform.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "stevearc/conform.nvim",
        },
        opts = {
            ensure_installed = {
                "clang-format",
                "stylua",
            }
        }
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                cpp = { "clang-format" },
            },
            format_on_save = { timeout_ms = 500 },
        },
    },
}

