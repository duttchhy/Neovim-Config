-- ~/.config/nvim/lua/plugins.lua
return {
-- Plugins
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.whichkey"),
require("plugins.neotree"),
  require("plugins.gitsigns"),
  require("plugins.mason"),
  -- Theming
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

