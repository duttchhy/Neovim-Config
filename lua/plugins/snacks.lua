return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = false },
            explorer = { enabled = false },
            image = { enabled = true },
            indent = {
                enabled = true,
                exclude = { "alpha", "dashboard" },
            },
            input = { enabled = true },
            picker = { enabled = true },
            lazygit = { enabled = true },
            win = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            terminal = { enabled = true },
        },
        config = function(_, opts)
            require("snacks").setup(opts)
            -- override vim.ui.input / select so Snacks works properly
            vim.ui.input = require("snacks.input").input
            vim.ui.select = require("snacks.picker").select
        end,
    },
    {
        "MunifTanjim/nui.nvim",
        event = "VeryLazy",
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
        keys = {
            {
                "<leader>qs",
                function()
                    require("persistence").load()
                end,
                desc = "Restore Session",
            },
            {
                "<leader>qS",
                function()
                    require("persistence").select()
                end,
                desc = "Select Session",
            },
            {
                "<leader>ql",
                function()
                    require("persistence").load({ last = true })
                end,
                desc = "Restore Last Session",
            },
            {
                "<leader>qd",
                function()
                    require("persistence").stop()
                end,
                desc = "Don't Save Current Session",
            },
        },
    },
}
