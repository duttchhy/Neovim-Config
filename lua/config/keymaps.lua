--      _____    ____   ____  _________________  _________________      _____    ____   ____  ____   ____  _____      _____
--  ___|\    \  |    | |    |/                 \/                 \ ___|\    \  |    | |    ||    | |    ||\    \    /    /|
-- |    |\    \ |    | |    |\______     ______/\______     ______//    /\    \ |    | |    ||    | |    || \    \  /    / |
-- |    | |    ||    | |    |   \( /    /  )/      \( /    /  )/  |    |  |    ||    |_|    ||    |_|    ||  \____\/    /  /
-- |    | |    ||    | |    |    ' |   |   '        ' |   |   '   |    |  |____||    .-.    ||    .-.    | \ |    /    /  /
-- |    | |    ||    | |    |      |   |              |   |       |    |   ____ |    | |    ||    | |    |  \|___/    /  /
-- |    | |    ||    | |    |     /   //             /   //       |    |  |    ||    | |    ||    | |    |      /    /  /
-- |____|/____/||\___\_|____|    /___//             /___//        |\ ___\/    /||____| |____||____| |____|     /____/  /
-- |    /    | || |    |    |   |`   |             |`   |         | |   /____/ ||    | |    ||    | |    |    |`    | /
-- |____|____|/  \|____|____|   |____|             |____|          \|___|    | /|____| |____||____| |____|    |_____|/
--   \(    )/       \(   )/       \(                 \(              \( |____|/   \(     )/    \(     )/         )/
--    '    '         '   '         '                  '               '   )/       '     '      '     '          '
-- Keymapping Configuration

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--===============
--  Personal Remaps
--===============
keymap("n", "<leader>qq", ":confirm q<CR>", vim.tbl_extend("force", opts, { desc = "Quit current buffer (confirm)" }))
keymap("n", "<leader>Q", ":confirm qa<CR>", vim.tbl_extend("force", opts, { desc = "Quit all buffers (confirm)" }))
keymap("n", "<leader>e", ":Ex<CR>", vim.tbl_extend("force", opts, { desc = "Open file explorer" }))
keymap("n", "q", "<Nop>", { desc = "Disable default 'q' macro recording" })
keymap("n", "<leader>W", "q", { desc = "Record macro (moved from q to <leader>w)" })

--===============
--   Visual Mode
--===============
keymap("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down" }))
keymap("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up" }))
keymap(
  "v",
  "<S-Down>",
  ":m '>+1<CR>gv=gv",
  vim.tbl_extend("force", opts, { desc = "Move selection down (Shift+Down)" })
)
keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up (Shift+Up)" }))

--===============
--   Normal Mode
--===============
keymap("n", "J", "mzJ`z", vim.tbl_extend("force", opts, { desc = "Join lines (keep cursor position)" }))
keymap("n", "<C-j>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page down (centered)" }))
keymap("n", "<C-k>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page up (centered)" }))
keymap("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (centered)" }))
keymap("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (centered)" }))
keymap("n", "<A-Down>", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (Alt+Down)" }))
keymap("n", "<A-Up>", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (Alt+Up)" }))

--===============
--   Editing Helpers
--===============
keymap("n", "=ap", "ma=ap`a", vim.tbl_extend("force", opts, { desc = "Re-indent paragraph" }))
keymap("n", "<C-a>", "gg<S-v>G", vim.tbl_extend("force", opts, { desc = "Select all text" }))
keymap("n", "<C-m>", "<C-i>", vim.tbl_extend("force", opts, { desc = "Fix jumplist (Ctrl+m behaves like Ctrl+i)" }))

--===============
--   Registers / Clipboard
--===============
keymap({ "n", "v", "x" }, "<C-c>", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
keymap({ "n", "v" }, "<leader>y", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
keymap({ "n", "v", "x" }, "<C-x>", [["+d]], vim.tbl_extend("force", opts, { desc = "Cut to system clipboard" }))
keymap({ "n", "v" }, "<leader>d", '"_d', vim.tbl_extend("force", opts, { desc = "Delete without affecting clipboard" }))

keymap({ "n", "v" }, "x", '"_x', { desc = "Delete single char silently" })
keymap({ "n", "v" }, "<Leader>c", '"_c', { desc = "Change without yanking" })
keymap({ "n", "v" }, "<Leader>C", '"_C', { desc = "Change to end without yanking" })
keymap({ "n", "v" }, "<Leader>D", '"_D', { desc = "Delete to end without yanking" })

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
