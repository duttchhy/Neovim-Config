-- lua/plugins/whichkey.lua
-- ==============================
-- WHICH-KEY PLUGIN CONFIG
-- ==============================
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- new spec format, no deprecated opts
    spec = {
      -- Telescope
      { "<leader>f", group = "Find" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },

      -- Tools on \
      { "\\", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
      { "\\u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
      { "\\tp", "<cmd>TSPlaygroundToggle<CR>", desc = "Treesitter Playground" },

      -- Example extra (if you want to keep these)
      { "\\ca", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Cellular Automaton Rain" },
      { "\\s", "<cmd>SearchReplaceSingleBufferVisualSelection<CR>", desc = "Search & Replace" },
    },
  },
}

