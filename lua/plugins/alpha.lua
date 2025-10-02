-- lua/plugins/alpha.lua
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		dashboard.section.header.val = {
			"NeoVim, But the I am a rice farmer!",
			"__________                        ",
			"\\______   \\____________    _____  ",
			" |    |  _/\\_  __ \\__  \\  /     \\ ",
			" |    |   \\ |  | \\// __ \\|  Y Y  \\",
			" |______  / |__|  (____  /__|_|  /",
			"        \\/             \\/      \\/ ",
		}
		-- Buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "📁  File Explorer", ":Ex<CR>"),
			dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
			dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		dashboard.section.footer.val = "🚀 Rocket Ship 8=======D 🚀"

		-- Layout
		alpha.setup(dashboard.config)
	end,
}

