-- lua/plugins/whichkey.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- You can add configuration here if needed
  },
  keys = {
    -- Telescope
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    -- NeoTree
    { "\\", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
    -- Treesitter Playground
    { "<\\tp>", "<cmd>TSPlaygroundToggle<CR>", desc = "Treesitter Playground" },
    -- Buffer local which-key
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

