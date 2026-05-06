return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        version = false,
        lazy = false,
        build = ":TSUpdate",
        opts = {
            indent = { enable = true },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            folds = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "css",
                "diff",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "printf",
                "python",
                "query",
                "regex",
                "ron",
                "rust",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
                "latex",
                "norg",
                "scss",
                "svelte",
            },
        },
        -- FIX: opts are not auto-passed to setup() on the main branch.
        -- This config function ensures all options (highlight, indent, ensure_installed etc.) are actually applied.
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        -- FIX: `after` is a packer.nvim key and is ignored by lazy.nvim.
        -- Use `dependencies` to guarantee load order.
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-context").setup({
                enable = true,
                multiwindow = false,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
}
