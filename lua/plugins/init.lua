-- Disable Perl and Ruby providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- NOTE: indentLine_fileTypeExclude is set in config/autocmds.lua (includes both "alpha" and "dashboard")
return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
}
