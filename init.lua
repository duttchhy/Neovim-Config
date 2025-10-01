--------------------------------------
--__________                          |
--\______   \____________    _____    |
--|    |  _/\_  __ \__  \  /     \    |
--|    |   \ |  | \// __ \|  Y Y  \   |
--|______  / |__|  (____  /__|_|  /   |
--\/             \/      \/           |
--------------------------------------

-- Install lazy.nvim if it's not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)
-- ./lua/plugins/*
require("lazy").setup(require("plugins"), {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table
    -- which will use the default lazy.nvim Nerd Font icons
    icons = vim.g.have_nerd_font and {} or {
      cmd     = "⌘",
      config  = "🛠",
      event   = "📅",
      ft      = "📂",
      init    = "⚙",
      keys    = "🗝",
      plugin  = "🔌",
      runtime = "💻",
      require = "🌙",
      source  = "📄",
      start   = "🚀",
      task    = "📌",
      lazy    = "💤 ",
    },
  },
})
-- ./lua/bram/*
require("bram")
