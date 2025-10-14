-- __________
-- \______   \____________    _____
--  |    |  _/\_  __ \__  \  /     \
--  |    |   \ |  | \// __ \|  Y Y  \
--  |______  / |__|  (____  /__|_|  /
--         \/             \/      \/
-- Keymapping Configuration

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--===============
--  Personal Remaps
--===============
keymap("n", "<leader>q", ":confirm q<CR>", vim.tbl_extend("force", opts, { desc = "Quit current buffer (confirm)" }))
keymap("n", "<leader>Q", ":confirm qa<CR>", vim.tbl_extend("force", opts, { desc = "Quit all buffers (confirm)" }))
keymap("n", "<leader>e", ":Ex<CR>", vim.tbl_extend("force", opts, { desc = "Open file explorer" }))
keymap('n', 'q', '<Nop>', { desc = "Disable default 'q' macro recording" })
keymap('n', '<leader>W', 'q', { desc = "Record macro (moved from q to <leader>w)" })

--===============
--   Visual Mode
--===============
keymap("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down" }))
keymap("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up" }))
keymap("v", "<S-Down>", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down (Shift+Down)" }))
keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up (Shift+Up)" }))
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down (Alt+Down)" }))
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up (Alt+Up)" }))

--===============
--   Normal Mode
--===============
keymap("n", "J", "mzJ`z", vim.tbl_extend("force", opts, { desc = "Join lines (keep cursor position)" }))
keymap("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page down (centered)" }))
keymap("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page up (centered)" }))
keymap("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (centered)" }))
keymap("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (centered)" }))
keymap("n", "<S-Down>", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (Shift+Down)" }))
keymap("n", "<S-Up>", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (Shift+Up)" }))
keymap("n", "<A-Down>", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (Alt+Down)" }))
keymap("n", "<A-Up>", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (Alt+Up)" }))

--===============
--   Quickfix & Location Lists
--===============
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", vim.tbl_extend("force", opts, { desc = "Next quickfix item" }))
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", vim.tbl_extend("force", opts, { desc = "Previous quickfix item" }))
keymap("n", "<S-Right>", "<cmd>cnext<CR>zz", vim.tbl_extend("force", opts, { desc = "Next quickfix item (Shift+Right)" }))
keymap("n", "<S-Left>", "<cmd>cprev<CR>zz", vim.tbl_extend("force", opts, { desc = "Previous quickfix item (Shift+Left)" }))
keymap("n", "<A-Right>", "<cmd>cnext<CR>zz", vim.tbl_extend("force", opts, { desc = "Next quickfix item (Alt+Right)" }))
keymap("n", "<A-Left>", "<cmd>cprev<CR>zz", vim.tbl_extend("force", opts, { desc = "Previous quickfix item (Alt+Left)" }))

keymap("n", "<leader>k", "<cmd>lnext<CR>zz", vim.tbl_extend("force", opts, { desc = "Next location list entry" }))
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", vim.tbl_extend("force", opts, { desc = "Previous location list entry" }))
keymap("n", "<leader><Down>", "<cmd>lnext<CR>zz", vim.tbl_extend("force", opts, { desc = "Next location list (Leader+Down)" }))
keymap("n", "<leader><Up>", "<cmd>lprev<CR>zz", vim.tbl_extend("force", opts, { desc = "Previous location list (Leader+Up)" }))

--===============
--   Editing Helpers
--===============
keymap("n", "=ap", "ma=ap`a", vim.tbl_extend("force", opts, { desc = "Re-indent paragraph" }))
keymap("i", "<C-c>", "<Esc>", vim.tbl_extend("force", opts, { desc = "Escape insert mode (Ctrl+C)" }))
keymap("n", "<C-a>", "gg<S-v>G", vim.tbl_extend("force", opts, { desc = "Select all text" }))
keymap("n", "<Leader>o", "o<Esc>^Da", vim.tbl_extend("force", opts, { desc = "Insert new line below (no comment continuation)" }))
keymap("n", "<Leader>O", "O<Esc>^Da", vim.tbl_extend("force", opts, { desc = "Insert new line above (no comment continuation)" }))
keymap("n", "<C-m>", "<C-i>", vim.tbl_extend("force", opts, { desc = "Fix jumplist (Ctrl+m behaves like Ctrl+i)" }))

--===============
--   Registers / Clipboard
--===============
keymap("x", "<leader>p", [["_dP]], vim.tbl_extend("force", opts, { desc = "Paste over selection without yanking" }))
keymap({ "n", "v" }, "<C-c>", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
keymap({ "n", "v" }, "<leader>y", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
keymap("n", "<leader>Y", [["+Y]], vim.tbl_extend("force", opts, { desc = "Yank full line to system clipboard" }))
keymap({ "n", "v" }, "<C-x>", [["+d]], vim.tbl_extend("force", opts, { desc = "Cut to system clipboard" }))
keymap({ "n", "v" }, "<leader>d", '"_d', vim.tbl_extend("force", opts, { desc = "Delete without affecting clipboard" }))

keymap("n", "x", '"_x', { desc = "Delete single char silently" })
keymap("n", "<Leader>p", '"0p', { desc = "Paste last yanked text (not deleted)" })
keymap("n", "<Leader>P", '"0P', { desc = "Paste last yanked text before cursor" })
keymap("v", "<Leader>p", '"0p', { desc = "Paste last yanked text (visual mode)" })
keymap("n", "<Leader>c", '"_c', { desc = "Change without yanking" })
keymap("n", "<Leader>C", '"_C', { desc = "Change to end of line without yanking" })
keymap("v", "<Leader>c", '"_c', { desc = "Change selection without yanking" })
keymap("v", "<Leader>C", '"_C', { desc = "Change selection to end without yanking" })
keymap("n", "<Leader>d", '"_d', { desc = "Delete without yanking" })
keymap("n", "<Leader>D", '"_D', { desc = "Delete to end of line without yanking" })
keymap("v", "<Leader>d", '"_d', { desc = "Delete selection without yanking" })
keymap("v", "<Leader>D", '"_D', { desc = "Delete selection to end without yanking" })

--===============
--   Numeric Controls
--===============
keymap("n", "+", "<C-a>", { desc = "Increment number under cursor" })
keymap("n", "-", "<C-x>", { desc = "Decrement number under cursor" })

--===============
--           Splits & Windows
--===============
keymap("n", "ss", ":split<Return>", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))
keymap("n", "sv", ":vsplit<Return>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
keymap("n", "sh", "<C-w>h", { desc = "Move to left window" })
keymap("n", "sk", "<C-w>k", { desc = "Move to upper window" })
keymap("n", "sj", "<C-w>j", { desc = "Move to lower window" })
keymap("n", "sl", "<C-w>l", { desc = "Move to right window" })
keymap("n", "<C-w><left>", "<C-w><", { desc = "Shrink window horizontally" })
keymap("n", "<C-w><right>", "<C-w>>", { desc = "Expand window horizontally" })
keymap("n", "<C-w><up>", "<C-w>+", { desc = "Increase window height" })
keymap("n", "<C-w><down>", "<C-w>-", { desc = "Decrease window height" })

