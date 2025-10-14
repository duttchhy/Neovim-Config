return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = '0.1.8',
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-lua/plenary.nvim"},
    },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Switch Buffer" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          mappings = {
            i = { ["<C-f>"] = actions.preview_scrolling_down, ["<C-b>"] = actions.preview_scrolling_up },
            n = { ["q"] = actions.close },
          },
        },
      }
    end,
  },
}


