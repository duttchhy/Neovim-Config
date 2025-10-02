--------------------------------------|
--__________                          |
--\______   \____________    _____    |
--|    |  _/\_  __ \__  \  /     \    |
--|    |   \ |  | \// __ \|  Y Y  \   |
--|______  / |__|  (____  /__|_|  /   |
--\/             \/      \/           |
--------------------------------------|
-- ==============================
-- PERSONAL REMAPS (non-plugin)
-- ==============================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ==============================
-- VISUAL MODE
-- ==============================
-- Move selected text up/down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Greatest remap ever: keep paste buffer
keymap("x", "<leader>P", [["_dP]], opts) -- NOTE: <leader>p is taken by plugin config, so use <leader>P instead

-- ==============================
-- NORMAL MODE
-- ==============================
-- Keep cursor position when joining lines
keymap("n", "J", "mzJ`z", opts)

-- Half-page jumping keeps cursor centered
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Next/Prev search result stays centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Re-indent paragraph and return
keymap("n", "=ap", "ma=ap`a", opts)

-- Quickfix navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)

-- Location list navigation
-- (leader>j/k already used by which-key, so mapped to q/j here)
keymap("n", "<leader>qj", "<cmd>lprev<CR>zz", opts)
keymap("n", "<leader>qk", "<cmd>lnext<CR>zz", opts)

-- Disable Ex mode
keymap("n", "Q", "<nop>", opts)

-- Escape in insert mode
keymap("i", "<C-c>", "<Esc>", opts)

-- ==============================
-- TMUX SESSIONIZER (external tool)
-- ==============================
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
keymap("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>", opts)
keymap("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>", opts)

