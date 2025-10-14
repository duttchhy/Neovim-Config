return {
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        lazy = true,
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>cF",
                function()
                    require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
                end,
                mode = { "n", "v" },
                desc = "Format Injected Langs",
            },
        },
        opts = function()
            ---@type conform.setupOpts
            local opts = {
                default_format_opts = {
                    timeout_ms = 3000,
                    async = false,
                    quiet = false,
                    lsp_format = "fallback",
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    fish = { "fish_indent" },
                    sh = { "shfmt" },
                },
                ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
                formatters = {
                    injected = { options = { ignore_errors = true } },
                },
            }
            return opts
        end,
        config = function(_, opts)
            require("conform").setup(opts)
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "lazy.nvim", words = { "LazyVim" } }, -- you can keep this if you want completions
            },
        },
    },
}

