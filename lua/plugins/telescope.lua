return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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

