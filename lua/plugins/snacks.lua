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
            -- FIX: picker disabled — conflicts with Telescope (both hook vim.ui.select).
            -- Keep one fuzzy finder. To use Snacks picker instead, remove Telescope.
            picker = { enabled = false },
            lazygit = { enabled = true },
            win = { enabled = true },
            -- FIX: notifier disabled — conflicts with Noice (both override vim.notify).
            -- Noice handles notifications. To use Snacks notifier instead, remove Noice.
            notifier = { enabled = false },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            terminal = { enabled = true },
        },
        config = function(_, opts)
            require("snacks").setup(opts)
            -- Snacks.input is still active — override vim.ui.input only (not select, which Telescope owns)
            vim.ui.input = require("snacks.input").input
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
