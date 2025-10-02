--------------------------------------|
--__________                          |
--\______   \____________    _____    |
--|    |  _/\_  __ \__  \  /     \    |
--|    |   \ |  | \// __ \|  Y Y  \   |
--|______  / |__|  (____  /__|_|  /   |
--\/             \/      \/           |
--------------------------------------|
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- ==============================
-- PERSONAL REMAPS
-- ==============================
keymap("n", "<leader>q", ":confirm q<CR>", opts)
keymap("n", "<leader>Q", ":confirm qa<CR>", opts)
keymap("n", "<leader>e", ":Ex<CR>", opts)

-- ==============================
-- VISUAL MODE
-- ==============================
-- Move selected text up/down (works with hjkl + arrows)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<S-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

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
keymap("n", "<S-Down>", "nzzzv", opts)
keymap("n", "<S-Up>", "Nzzzv", opts)
keymap("n", "<A-Down>", "nzzzv", opts)
keymap("n", "<A-Up>", "Nzzzv", opts)

-- Quickfix navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<S-Right>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<S-Left>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<A-Right>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<A-Left>", "<cmd>cprev<CR>zz", opts)

-- Location list navigation
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
keymap("n", "<leader><Down>", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader><Up>", "<cmd>lprev<CR>zz", opts)


-- Re-indent paragraph and return
keymap("n", "=ap", "ma=ap`a", opts)

-- Escape in insert mode
keymap("i", "<C-c>", "<Esc>", opts)

-- ==============================
-- REGISTERS / CLIPBOARD
-- ==============================
keymap("x", "<leader>p", [["_dP]], opts) -- paste over selection
keymap({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)
keymap({ "n", "v" }, "<leader>d", "\"_d", opts)

-- ==============================
-- TMUX SESSIONIZER
-- ==============================
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
keymap("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>", opts)
keymap("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>", opts)

