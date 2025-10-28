return {
    "obsidian-nvim/obsidian.nvim",
    dependencies = { "nvim-cmp" },
    version = "*", -- recommended, use latest release instead of latest commit
    ft = { "markdown", "md" },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = "~/Documents/Notes",
            },
        },
    },
}
