-- Disable Perl and Ruby providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.indentLine_fileTypeExclude = { "alpha" }
return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
}
