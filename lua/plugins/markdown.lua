return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { "markdown", "quarto" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        opts = {
            enabled = true,
            render_modes = true,
            file_types = { "markdown", "quarto" },
            completions = { lsp = { enabled = true } },
            link = {
                enabled = true,
                render_modes = { "n", "v", "i" },
                collapse = true,
                highlight = 'RenderMarkdownLink',
            },
        },
        config = function(_, opts)
            require("render-markdown").setup(opts)

            -- Conceal options
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "markdown", "quarto" },
                callback = function()
                    vim.wo.conceallevel = 2
                    vim.wo.concealcursor = "nc"
                end,
            })

            -- Snacks toggle mapping
            if Snacks then
                Snacks.toggle({
                    name = "Render Markdown",
                    get = require("render-markdown").get,
                    set = require("render-markdown").set,
                }):map("<leader>um")
            end
        end,
    }
}

