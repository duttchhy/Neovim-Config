return {
-- devicons
    {
        "nvim-tree/nvim-web-devicons", opts = {} 
    },
	-- Undotree
	{
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
		},
		init = function()
			vim.g.undotree_WindowLayout = 2      -- right side
			vim.g.undotree_SplitWidth = 30       -- window width
			vim.g.undotree_SetFocusWhenToggle = 1
            vim.opt.undodir = vim.fn.expand("~/.config/vim/undodir")
            vim.opt.undofile = true
		end,
	},

	-- Comment Nvim
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},

	-- TODO Comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("todo-comments").setup({
				keywords = {
					FIX = { icon = " ", color = "error" },
					TODO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning" },
					PERF = { icon = " ", color = "hint" },
					NOTE = { icon = " ", color = "hint" },
				},
				highlight = {
					multiline = true,
					pattern = [[.*<(KEYWORDS)\s*:]],
				},
				merge_keywords = true,
			})

			-- Telescope integration
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
		end,
	},
}

