-- Colorscheme: loaded first to avoid flash of default colors.
vim.pack.add({
	"https://github.com/catppuccin/nvim",
})

require("catppuccin").setup({
	flavour = "frappe",
	background = {
		light = "latte",
		dark = "frappe",
	},
	transparent_background = false,
	show_end_of_buffer = true,
	term_colors = true,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		blink_cmp = true,
		aerial = true,
		bufferline = true,
		dashboard = true,
		gitsigns = true,
		indent_blankline = { enabled = true },
		markdown = true,
		mini = { enabled = true },
		snacks = true,
		telescope = { enabled = false },
		trouble = true,
		which_key = true,
	},
})

vim.cmd.colorscheme("catppuccin")
