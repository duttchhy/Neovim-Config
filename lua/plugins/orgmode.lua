return {
    "nvim-orgmode/orgmode",
    ft = {".org"},
    dependencies = {
        "akinsho/org-bullets.nvim",
        "dhruvasagar/vim-table-mode",
    },
    config = function()
        local onedark = require "onedark"
        -- require("orgmode").setup_ts_grammar()
        require("orgmode").setup {
            org_default_notes_file = "~/dev/org/notes.org",
            org_agenda_templates = {
                f = {
                    description = "File notes",
                    template = "* TODO %?\n  %u\n  %a",
                    target = "~/dev/org/notes.org",
                },
            },
            org_todo_keywords = { "TODO(t)", "|", "DONE", "CANCELED" },
            org_todo_keyword_faces = {
                TODO = ":foreground " .. onedark.colors.purple .. " :weight bold",
                DONE = ":foreground " .. onedark.colors.green .. " :weight bold",
                CANCELED = ":foreground " .. onedark.colors.red .. " :weight bold",
            },
            org_hide_emphasis_markers = true,
            org_startup_indented = true,
            org_adapt_indentation = false,
            mappings = {
                disable_all = true,
            },
        }

        -- vim.keymaps
        vim.keymap.set("n", "<leader>mf", function()
            require("orgmode").action "capture.prompt"
        end)
        vim.keymap.set("n", "<leader>ma", function()
            require("orgmode").action "agenda.prompt"
        end)
    end,  -- <- this closes the config function
}

