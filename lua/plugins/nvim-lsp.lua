return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
                "lua-language-server",
                "bash-language-server",
                "json-lsp",
                "yaml-language-server",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")

            -- Auto-install missing tools
            mr.refresh(function()
                for _, tool in ipairs(opts.ensure_installed or {}) do
                    local pkg = mr.get_package(tool)
                    if not pkg:is_installed() then
                        pkg:install()
                    end
                end
            end)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "bashls", "jsonls", "yamlls" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- Servers configuration
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = { checkThirdParty = false },
                        },
                    },
                },
                bashls = {},
                jsonls = {},
                yamlls = {},
            }

            for server, config in pairs(servers) do
                config.capabilities = capabilities
                lspconfig[server].setup(config)
            end
        end,
    },
}

