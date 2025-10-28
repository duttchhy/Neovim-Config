return {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "Avante", "codecompanion", "opencode_output" },
    init = function()
        vim.keymap.set("n", "<C-s>M", function()
            if vim.bo.filetype == "markdown" then
                vim.cmd "Markview Toggle"
            else
                vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markview" })
            end
        end, { desc = "Toggle Markview", silent = true })
    end,
    opts = {
        preview = {
            filetypes = { "markdown", "Avante", "codecompanion", "opencode_output" },
            ignore_buftypes = {},
        },
        max_length = 99999,
        experimental = { check_rtp_message = false },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    {
        "iamcco/markdown-preview.nvim",
        enabled = false,
        init = function()
            vim.keymap.set("n", "<C-s>M", function()
                if vim.bo.filetype == "markdown" then
                    vim.cmd "MarkdownPreviewToggle"
                else
                    vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
                end
            end, { desc = "Markdown Preview", silent = true })
        end,
        build = function()
            require("lazy").load { plugins = { "markdown-preview.nvim" } }
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
    },
}
