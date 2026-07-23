-- UI: which-key, mini.nvim, alpha dashboard, bufferline, trouble, aerial,
-- oil file manager, toggleterm.

vim.pack.add({
	-- Keybind hint popup
	"https://github.com/folke/which-key.nvim",
	-- mini.nvim (icons + statusline)
	"https://github.com/echasnovski/mini.nvim",
	-- Dashboard / start screen
	"https://github.com/goolord/alpha-nvim",
	-- VSCode-style buffer tab bar
	{ src = "https://github.com/akinsho/bufferline.nvim", version = vim.version.range("*") },
	-- Problems panel (like VSCode Ctrl+Shift+M)
	"https://github.com/folke/trouble.nvim",
	-- Symbol outline sidebar
	"https://github.com/stevearc/aerial.nvim",
	-- File manager as a buffer (edit filesystem like text)
	"https://github.com/stevearc/oil.nvim",
	-- Integrated terminal toggled with Ctrl+`
	{ src = "https://github.com/akinsho/toggleterm.nvim", version = vim.version.range("*") },
	--NVIM Tree
	"https://github.com/nvim-tree/nvim-tree.lua",
	-- Integrated terminal
	{ src = "https://github.com/akinsho/toggleterm.nvim", version = vim.version.range("*") },
})

-- which-key
require("which-key").setup({
	delay = 0,
	icons = {
		mappings = vim.g.have_nerd_font,
		keys = vim.g.have_nerd_font and {} or {
			Up = "<Up> ",
			Down = "<Down> ",
			Left = "<Left> ",
			Right = "<Right> ",
			C = "<C-…> ",
			M = "<M-…> ",
			D = "<D-…> ",
			S = "<S-…> ",
			CR = "<CR> ",
			Esc = "<Esc> ",
			ScrollWheelDown = "<ScrollWheelDown> ",
			ScrollWheelUp = "<ScrollWheelUp> ",
			NL = "<NL> ",
			BS = "<BS> ",
			Space = "<Space> ",
			Tab = "<Tab> ",
			F1 = "<F1>",
			F2 = "<F2>",
			F3 = "<F3>",
			F4 = "<F4>",
			F5 = "<F5>",
			F6 = "<F6>",
			F7 = "<F7>",
			F8 = "<F8>",
			F9 = "<F9>",
			F10 = "<F10>",
			F11 = "<F11>",
			F12 = "<F12>",
		},
	},
	spec = {
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
	},
})

-- mini.nvim (only icons + statusline)
require("mini.icons").setup()
require("mini.ai").setup({ n_lines = 500 })
require("mini.surround").setup()
local statusline = require("mini.statusline")
statusline.setup({ use_icons = vim.g.have_nerd_font })
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return "%2l:%-2v"
end

-- alpha dashboard
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"									Setup Proudly stolen by									",
	"	    :::::::::  :::    ::: ::::::::::: ::::::::::: ::::::::  :::    ::: :::    ::: :::   ::: ",
	"     :+:    :+: :+:    :+:     :+:         :+:    :+:    :+: :+:    :+: :+:    :+: :+:   :+:  ",
	"    +:+    +:+ +:+    +:+     +:+         +:+    +:+        +:+    +:+ +:+    +:+  +:+ +:+    ",
	"   +#+    +:+ +#+    +:+     +#+         +#+    +#+        +#++:++#++ +#++:++#++   +#++:      ",
	"   +#+    +#+ +#+    +#+     +#+         +#+    +#+        +#+    +#+ +#+    +#+    +#+        ",
	" #+#    #+# #+#    #+#     #+#         #+#    #+#    #+# #+#    #+# #+#    #+#    #+#         ",
	"#########   ########      ###         ###     ########  ###    ### ###    ###    ###          ",
}
dashboard.section.buttons.val = {
	dashboard.button("n", " 	New File", ":ene <BAR> startinsert<CR>"),
	dashboard.button("e", "📁	Explorer", ":Oil<CR>"),
	dashboard.button("f", "🔍	Find Text", ":lua Snacks.picker.grep()<CR>"),
	dashboard.button("u", "󰄉 	Update Plugins", ":lua vim.pack.update()<CR>"),
	dashboard.button("c", " 	Neovim Settings", ":lua require('oil').open(vim.fn.stdpath('config'))<CR>"),
	dashboard.button("q", "q	Quit Neovim", ":q!<CR>"),
}
-- Recent files section (1-9)
local mru = require("alpha.themes.startify").mru
dashboard.section.mru = {
	type = "group",
	val = function()
		local items = {}
		local recentfiles = vim.v.oldfiles or {}
		local count = 0
		for _, file in ipairs(recentfiles) do
			if count >= 9 then
				break
			end
			if vim.fn.filereadable(file) == 1 then
				count = count + 1
				local short = vim.fn.fnamemodify(file, ":~:.")
				items[#items + 1] =
					dashboard.button(tostring(count), "  " .. short, ":e " .. vim.fn.fnameescape(file) .. "<CR>")
			end
		end
		return items
	end,
}

dashboard.config.layout = {
	{ type = "padding", val = 2 },
	dashboard.section.header,
	{ type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	{ type = "text", val = "  Recent Files", opts = { hl = "SpecialComment", position = "center" } },
	{ type = "padding", val = 1 },
	dashboard.section.mru,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}

alpha.setup(dashboard.config)

-- Suppress empty buffer resize errors
vim.api.nvim_create_autocmd("WinResized", {
	callback = function()
		pcall(function()
			require("alpha").redraw()
		end)
	end,
})

vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

-- bufferline
require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		offsets = { { filetype = "snacks_layout_box", text = "Explorer" } },
		separator_style = "slant",
		always_show_bufferline = true,
		enforce_regular_tabs = true,
	},
	highlights = {
		buffer_selected = { bold = true, italic = false },
		indicator_selected = { bold = true },
	},
})
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

-- trouble
require("trouble").setup({})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle<CR>", { desc = "Symbols (Trouble)" })

-- aerial
require("aerial").setup({})
vim.keymap.set("n", "<leader>v", "<cmd>AerialToggle!<CR>", { desc = "Toggle outline [V]iew" })

-- oil
local oil = require("oil")
oil.setup({
	columns = { "icon" },
	keymaps = {
		["<C-l>"] = false,
		["<C-j>"] = false,
		["<M-h>"] = "actions.select_split",
		["q"] = "actions.close",
		["<Esc>"] = "actions.close",
	},
	view_options = { show_hidden = true },
})
vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory (oil)" })
vim.keymap.set("n", "<leader>e", oil.open, { desc = "Open file explorer (oil)" })
vim.keymap.set("n", "<leader>o", oil.toggle_float, { desc = "Toggle oil float (floating window)" })

-- NVIM-Tree
require("nvim-tree").setup()
vim.keymap.set("n", "\\", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
-- toggleterm
require("toggleterm").setup({
	size = 15,

	shade_terminals = true,
})
vim.keymap.set("n", "<C-`>", function()
	local dir = vim.fn.expand("%:p:h")
	if dir == "" or vim.fn.isdirectory(dir) == 0 then
		local cwd = vim.uv.cwd()
		dir = cwd or "."
	end
	vim.cmd("ToggleTerm dir=" .. vim.fn.fnameescape(dir))
end, { desc = "Toggle terminal (buffer directory)" })

-- run current file (<leader>r) — like VS Code/Zed's "run" button
local Terminal = require("toggleterm.terminal").Terminal

-- NOTE: vim.fn.expand() only expands "%:p" etc. when that's the WHOLE string
-- passed to it, not when embedded inside a longer command like "go run %:p".
-- So each runner is a function that builds the command from already-expanded
-- fields, instead of a template string handed to expand().
local runners = {
	python = function(f)
		return "python3 " .. f.file
	end,
	javascript = function(f)
		return "node " .. f.file
	end,
	typescript = function(f)
		return "npx ts-node " .. f.file
	end,
	lua = function(f)
		return "lua " .. f.file
	end,
	sh = function(f)
		return "bash " .. f.file
	end,
	rust = function(f)
		return "cd " .. f.dir .. " && rustc " .. f.name .. " -o /tmp/" .. f.noext .. " && /tmp/" .. f.noext
	end,
	c = function(f)
		return "gcc " .. f.file .. " -o /tmp/" .. f.noext .. " && /tmp/" .. f.noext
	end,
	cpp = function(f)
		return "g++ " .. f.file .. " -o /tmp/" .. f.noext .. " && /tmp/" .. f.noext
	end,
	go = function(f)
		return "go run " .. f.file
	end,
	java = function(f)
		return "cd " .. f.dir .. " && javac " .. f.name .. " && java " .. f.noext
	end,
}

local run_term -- keep a handle so repeated runs reuse one split instead of stacking

vim.keymap.set("n", "<leader>r", function()
	local ft = vim.bo.filetype
	local build_cmd = runners[ft]
	if not build_cmd then
		vim.notify("No run command configured for filetype: " .. ft, vim.log.levels.WARN)
		return
	end

	vim.cmd("write") -- save before running

	local fields = {
		file = vim.fn.expand("%:p"),
		dir = vim.fn.expand("%:p:h"),
		name = vim.fn.expand("%:t"),
		noext = vim.fn.expand("%:t:r"),
	}

	if run_term then
		run_term:close() -- hide the previous run's window
	end

	run_term = Terminal:new({
		cmd = build_cmd(fields),
		direction = "horizontal",
		close_on_exit = false, -- leave output visible after it finishes
	})
	run_term:open()
end, { desc = "Run current file" })
