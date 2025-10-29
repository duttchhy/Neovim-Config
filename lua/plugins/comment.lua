return {
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        config = function(_, opts)
            local comment = require("Comment")
            comment.setup(opts)

            -- Custom keybindings
            local api = require("Comment.api")

            -- NORMAL mode: toggle comment on current line
            vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { desc = "Toggle comment line" })

            -- VISUAL mode: toggle comment on selected region
            vim.keymap.set("x", "<C-_>", function()
                -- ESC first to ensure correct visual range
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
                api.toggle.linewise(vim.fn.visualmode())
            end, { desc = "Toggle comment selection" })
        end,
    },
}
