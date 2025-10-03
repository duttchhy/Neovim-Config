-- ~/.config/nvim/lua/plugins.lua
vim.g.mapleader = ' '
vim.g.amplocalleader = ' '
return {
-- Plugins
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.whichkey"),
  require("plugins.dependencies"),
  -- require("plugins.neotree"),
  require("plugins.gitsigns"),
  require("plugins.harpoon"),
  require("plugins.mason"),
  require("plugins.alpha"),
  require("plugins.mini"),
  require("plugins.ollama_copilot"),
  require("plugins.luarocks"),
  -- Theming
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine")()
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}

