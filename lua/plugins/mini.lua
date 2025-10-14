return {
  {
    "nvim-mini/mini.ai",
    -- load immediately or use BufReadPost if lazy-loading
    events = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
          d = { "%f[%d]%d+" },
          e = {
            { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
            "^().*()$",
          },
          g = function() return vim.api.nvim_buf_get_lines(0, 0, -1, false) end,
          u = ai.gen_spec.function_call(),
          U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(type(opts) == "function" and opts() or opts)
    end,
  },
  {
    "nvim-mini/mini.pairs",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  {
    "nvim-mini/mini.icons",
    lazy = true,
    opts = {
      file = { [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" }, ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" } },
      filetype = { dotenv = { glyph = "", hl = "MiniIconsYellow" } },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "nvim-mini/mini.indentscope",
    events = "VeryLazy",
    opts = { symbol = "│", options = { try_as_border = true } },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
}
