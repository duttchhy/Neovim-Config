-- lua/plugins/whichkey.lua
-- ==============================
-- WHICH-KEY CONFIGURATION
-- ==============================
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {  -- opts.window is deprecated, use opts.win
      border = "rounded",
      position = "bottom",
      margin = { 1, 1, 1, 1 },
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 5,
      align = "center",
    },
    spec = {}, -- empty, we populate below
    show_help = true,
    show_keys = true,
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- ==============================
    -- PLUGIN MAPPINGS
    -- ==============================
    wk.add({
      { lhs = "<leader>ff", rhs = "<cmd>Telescope find_files<CR>", desc = "Find Files", mode = "n" },
      { lhs = "<leader>fb", rhs = "<cmd>Telescope buffers<CR>", desc = "Buffers", mode = "n" },
      { lhs = "<leader>fg", rhs = "<cmd>Telescope live_grep<CR>", desc = "Live Grep", mode = "n" },
      { lhs = "<leader>fh", rhs = "<cmd>Telescope help_tags<CR>", desc = "Help Tags", mode = "n" },
      { lhs = "<leader>tp", rhs = "<cmd>TSPlaygroundToggle<CR>", desc = "Treesitter Playground", mode = "n" },
      { lhs = "<leader>u", rhs = "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree", mode = "n" },

      -- ==============================
      -- COMMENT TOGGLE (Ctrl+/)
      -- ==============================
      { lhs = "<C-_>", 
        rhs = function()
          local api = require("Comment.api")
          local mode = vim.fn.mode()
          if mode == "v" or mode == "V" or mode == "\22" then
            api.toggle.linewise(vim.fn.visualmode())
          else
            api.toggle.linewise.current()
          end
        end,
        desc = "Toggle Comment",
        mode = { "n", "v" },
      },

      -- ==============================
      -- SEARCH / QUICKFIX 
      -- ==============================
      { lhs = "<A-Up>", rhs = "Nzzzv", desc = "Prev Search Result", mode = "n" },
      { lhs = "<A-Down>", rhs = "nzzzv", desc = "Next Search Result", mode = "n" },
      { lhs = "<A-Left>", rhs = "<cmd>cprev<CR>zz", desc = "Prev Quickfix", mode = "n" },
      { lhs = "<A-Right>", rhs = "<cmd>cnext<CR>zz", desc = "Next Quickfix", mode = "n" },
    })
  end,
}

