return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = false},
			dashboard = { enabled = false },
			explorer = { enabled = false },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
--			notifier = {
--				enabled = true,
--				timeout = 3000,
--			},
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		keys = {
			{ "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
			{ "<leader>qS", function() require("persistence").select() end, desc = "Select Session" },
			{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
			{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
		},
	},
}

