return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            {
                "williamboman/mason.nvim",
                event = "VeryLazy",
                opts = {},
            },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim", opts = {} },
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- LspAttach autocmd
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    -- Telescope-based LSP navigation
                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                    -- Core LSP actions
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, {
                        buffer = event.buf,
                        desc = "LSP: Code Action",
                    })
                end,
            })

            -- Capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            -- LSP servers
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" },
                            diagnostics = {
                                globals = { "vim" }, -- helps avoid false 'undefined' errors
                            },
                        },
                    },
                },
            }

            local ensure_installed = vim.tbl_keys(servers)
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })

            -- Diagnostics configuration
            -- FIX: vim.diagnostic.define_sign does not exist in any Neovim version — that branch
            -- was always false. Using the modern signs table in vim.diagnostic.config() instead,
            -- which is the correct approach for Neovim 0.10+.
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                    spacing = 4,
                },
                float = {
                    border = "rounded",
                    source = "always",
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.HINT]  = " ",
                        [vim.diagnostic.severity.INFO]  = " ",
                    },
                },
                severity_sort = true,
                update_in_insert = false,
            })
            --      -- Show diagnostics in a floating window on hover
            --      vim.api.nvim_create_autocmd("CursorHold", {
            --        callback = function()
            --          vim.diagnostic.open_float(nil, { focus = false })
            --        end,
            --      })
        end,
    },
}
