-- opencode.nvim: AI coding assistant integration.
-- Requires opencode CLI: https://opencode.ai

vim.pack.add({
	{ src = "https://github.com/nickjvandyke/opencode.nvim", version = vim.version.range("*") },
})

---@type opencode.Opts
vim.g.opencode_opts = {}

vim.o.autoread = true -- Required for opts.events.reload

-- Ask opencode about selection/context
vim.keymap.set({ "n", "x" }, "<leader>aa", function()
	require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode" })

-- Execute opencode action
vim.keymap.set({ "n", "x" }, "<leader>ax", function()
	require("opencode").select()
end, { desc = "Execute opencode action" })

-- Toggle opencode terminal
vim.keymap.set({ "n", "t" }, "<leader>at", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode" })

-- Add range/line to opencode context (operator)
vim.keymap.set({ "n", "x" }, "go", function()
	return require("opencode").operator("@this ")
end, { desc = "Add range to opencode", expr = true })

vim.keymap.set("n", "goo", function()
	return require("opencode").operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })

-- Scroll opencode session window
vim.keymap.set("n", "<S-C-u>", function()
	require("opencode").command("session.half.page.up")
end, { desc = "Scroll opencode up" })

vim.keymap.set("n", "<S-C-d>", function()
	require("opencode").command("session.half.page.down")
end, { desc = "Scroll opencode down" })
