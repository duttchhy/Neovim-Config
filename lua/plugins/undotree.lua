return{
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
}
