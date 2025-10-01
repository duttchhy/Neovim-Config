--------------------------------------|
--__________                          |
--\______   \____________    _____    |
--|    |  _/\_  __ \__  \  /     \    |
--|    |   \ |  | \// __ \|  Y Y  \   |
--|______  / |__|  (____  /__|_|  /   |
--\/             \/      \/           |
--------------------------------------|
-- Set Leader
vim.g.mapleader = " "
-- VIM Explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- Quit Neovim
vim.keymap.set("n", "<leader>Q", vim.cmd.q)
-- Lazy Keymaps
require("lazy").setup({})

