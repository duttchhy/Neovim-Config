-- lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false},
    explorer = { enabled = false},
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = { notification = {} },
  },
  keys = {
    { "<leader>ss", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>se", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>sp")
      end,
    })
  end,
}

