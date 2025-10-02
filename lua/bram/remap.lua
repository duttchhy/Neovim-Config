--------------------------------------|
--__________                          |
--\______   \____________    _____    |
--|    |  _/\_  __ \__  \  /     \    |
--|    |   \ |  | \// __ \|  Y Y  \   |
--|______  / |__|  (____  /__|_|  /   |
--\/             \/      \/           |
--------------------------------------|
-- Lazy Keymaps
require("lazy").setup({})
-- ==============================
-- LEADER KEY
-- ==============================
vim.g.mapleader = " "

-- ==============================
-- FILE EXPLORER / NAVIGATION
-- ==============================
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)  -- open netrw

-- ==============================
-- VISUAL MODE MOVEMENT
-- ==============================
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- move selection down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")  -- move selection up

-- ==============================
-- PLUGINS
-- ==============================
-- Plenary test runner
vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

-- LSP
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Cellular Automaton
vim.keymap.set("n", "<leader>ca", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

-- ==============================
-- MOVEMENT & SCROLLING
-- ==============================
vim.keymap.set("n", "J", "mzJ`z")       -- join lines without moving cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- half-page down, center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- half-page up, center cursor
vim.keymap.set("n", "n", "nzzzv")       -- next search result, center
vim.keymap.set("n", "N", "Nzzzv")       -- prev search result, center

-- ==============================
-- PASTE / DELETE REGISTERS
-- ==============================
vim.keymap.set("x", "<leader>p", [["_dP]])        -- paste over selection without overwriting register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])          -- copy line to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d") -- delete without affecting registers

-- ==============================
-- INSERT MODE
-- ==============================
vim.keymap.set("i", "<C-c>", "<Esc>") -- exit insert mode

-- ==============================
-- DISABLED / NO-OPS
-- ==============================
vim.keymap.set("n", "Q", "<nop>") -- disable Q

-- ==============================
-- TERMINAL / TMUX
-- ==============================
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

-- ==============================
-- QUICKFIX / LOCATION LIST NAVIGATION
-- ==============================
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- ==============================
-- SEARCH & REPLACE
-- ==============================
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- ==============================
-- FILE MANAGEMENT
-- ==============================
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- ==============================
-- SNIPPETS / AUTOINSERT
-- ==============================
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
vim.keymap.set("n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a")
vim.keymap.set("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj")
vim.keymap.set("n", "<leader>el", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i")

-- ==============================
-- MISC
-- ==============================
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

