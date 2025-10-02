-- lua/plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/playground",
    },
    config = function()
        -- Skip deprecated module integration
        vim.g.skip_ts_context_commentstring_module = true

        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua", "vim", "bash", "python", "javascript",
                "typescript", "html", "css", "json", "markdown",
                "todotxt"  -- added here
            },
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },

            indent = {
                enable = true,
                disable = { "python" },
            },

            autotag = { enable = true },

            playground = {
                enable = true,
                disable = {},
                updatetime = 25,
                persist_queries = false,
                keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                },
            },
        })

        -- Setup ts_context_commentstring separately
        require("ts_context_commentstring").setup({})

        -- Keymap to toggle Treesitter Playground
        vim.keymap.set("n", "<leader>tp", ":TSPlaygroundToggle<CR>", { desc = "Toggle Treesitter Playground" })
    end
}
