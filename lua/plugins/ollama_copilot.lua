-- File: ~/.config/nvim/lua/plugins/ollama_copilot.lua
-- File: ~/.config/nvim/lua/plugins/ollama_complete.lua
return {
  ------------------------------------------------------------------------
  -- nvim-cmp (completion engine) + LuaSnip + LSP integration
  ------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source
      "hrsh7th/cmp-buffer",    -- buffer completions
      "hrsh7th/cmp-path",      -- path completions
      "hrsh7th/cmp-cmdline",   -- command line completions
      "L3MON4D3/LuaSnip",      -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        }),
      })
    end,
  },

  ------------------------------------------------------------------------
  -- Ollama-Copilot for AI code suggestions
  ------------------------------------------------------------------------
--  {
--    "Jacob411/Ollama-Copilot",
--    event = "VeryLazy",
--    opts = {
--      ollama_url = "http://localhost:11434",
--      model_name = "codellama:7b-code",
--      stream_suggestion = true,
--      ollama_model_opts = { num_predict = 40, temperature = 0.1 },
--      filetypes = {
--        "python", "javascript", "typescript", "html", "css", "lua", "java", "markdown",
--      },
--      keymaps = {
--        accept_suggestion = "<C-l>",
--        next_suggestion = "<C-n>",
--        prev_suggestion = "<C-p>",
--        toggle_suggestion = "<C-\\>",
--      },
--      python_command = "python3",
--    },
--    config = function(_, opts)
--      require("OllamaCopilot").setup(opts)
--    end,
--  },
}
