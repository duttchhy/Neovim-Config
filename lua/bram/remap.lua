--------------------------------------|
--__________                          |
--\______   \____________    _____    |
--|    |  _/\_  __ \__  \  /     \    |
--|    |   \ |  | \// __ \|  Y Y  \   |
--|______  / |__|  (____  /__|_|  /   |
--\/             \/      \/           |
--------------------------------------|
-- ==============================
-- PERSONAL KEYMAPS (remap.lua)
-- ==============================
local wk = require("which-key")

-- ------------------------------
-- Core keymaps
-- ------------------------------
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank Line to Clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to Clipboard" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without affecting registers" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make File Executable" })

-- quickfix navigation
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev Location" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location" })

-- error helpers
vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err) <Esc>', { desc = "Insert assert.NoError" })
vim.keymap.set("n", "<leader>el", 'ologger.Error(err) <Esc>', { desc = "Insert logger.Error" })
vim.keymap.set("n", "<leader>ee", 'oreturn err<Esc>', { desc = "Insert return err" })
vim.keymap.set("n", "<leader>ef", 'olog.Fatalf("%v", err)<Esc>', { desc = "Insert log.Fatalf" })

-- ------------------------------
-- Which-key group labels only
-- ------------------------------
wk.add({
  { "<leader>e", group = "Error Helpers" },
  { "<leader>f", group = "Find" },
  { "g", group = "LSP" },
})

