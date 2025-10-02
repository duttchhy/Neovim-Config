-- ~/.config/nvim/lua/plugins.lua
return {
-- Plugins
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.whichkey"),
  require("plugins.dependencies"),
  require("plugins.neotree"),
  require("plugins.gitsigns"),
  require("plugins.mason"),
  require("plugins.alpha"),
  require("plugins.mini"),
  require("plugins.luarocks"),
  -- Theming
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

