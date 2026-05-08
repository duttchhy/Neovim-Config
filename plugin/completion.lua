-- Completion: blink.cmp, LuaSnip, lazydev.

-- Build hook: compile jsregexp for LuaSnip after install/update
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "LuaSnip" and (kind == "install" or kind == "update") then
			if vim.fn.has("win32") == 0 and vim.fn.executable("make") == 1 then
				vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path })
			end
		end
	end,
})

vim.pack.add({
	-- Completion engine
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
	-- Snippets
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.x") },
	-- Neovim Lua API completions
	"https://github.com/folke/lazydev.nvim",
})

-- lazydev: Neovim Lua API types & completions for Lua config files
require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		{ path = "snacks.nvim", words = { "Snacks" } },
	},
})

-- LuaSnip
require("luasnip").setup({})

-- blink.cmp
--- @module 'blink.cmp'
--- @type blink.cmp.Config
require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 } },
	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
		},
	},
	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
})
