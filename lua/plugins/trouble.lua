return {
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle" },
        opts = {
            position = "right", -- positions the Trouble window
        },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
            { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
            { "<leader>xQ", "<cmd>TroubleToggle qflist<cr>", desc = "Quickfix List (Trouble)" },
            { "<leader>cs", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", desc = "Symbols (Trouble)" },
            { "<leader>cS", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP references (Trouble)" },
            {
                "[q",
                function()
                    local trouble = require("trouble")
                    if trouble.is_open() then
                        trouble.prev({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then vim.notify(err, vim.log.levels.ERROR) end
                    end
                end,
                desc = "Previous Trouble/Quickfix Item",
            },
            {
                "]q",
                function()
                    local trouble = require("trouble")
                    if trouble.is_open() then
                        trouble.next({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then vim.notify(err, vim.log.levels.ERROR) end
                    end
                end,
                desc = "Next Trouble/Quickfix Item",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        opts = {},
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
            { "<leader>xt", "<cmd>TroubleToggle todo<cr>", desc = "Todo (Trouble)" },
            { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        },
    },
}

