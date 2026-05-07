-- Markdown: markview.nvim for rich inline preview rendering.

vim.pack.add({
	-- Markdown
	"https://github.com/OXY2DEV/markview.nvim",
	-- Latex
	"https://github.com/lervag/vimtex",
})

-- Defer setup until a markdown-like buffer is opened (replaces lazy ft= loading)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "Avante", "codecompanion", "opencode_output" },
	once = true,
	callback = function()
		require("markview").setup({
			preview = {
				filetypes = { "markdown", "Avante", "codecompanion", "opencode_output" },
				ignore_buftypes = {},
			},
			max_length = 99999,
			experimental = { check_rtp_message = false },
		})
	end,
})

-- Toggle markview (only active in supported filetypes)
vim.keymap.set("n", "<C-s>M", function()
	local ft = vim.bo.filetype
	local supported = { markdown = true, Avante = true, codecompanion = true, opencode_output = true }
	if supported[ft] then
		vim.cmd("Markview Toggle")
	else
		vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markview" })
	end
end, { desc = "Toggle Markview", silent = true })

-- VimTeX config must be set before the plugin initialises
vim.g.vimtex_view_method = "zathura"
