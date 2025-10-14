return{
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { "markdown", "quatro" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            enabled = true,
            render_modes = true,
            file_types = { "markdown", "quatro" },
            completions = { lsp = { enabled = true } },
        },
    }
}
