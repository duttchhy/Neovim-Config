--      _____    ____   ____  _________________  _________________      _____    ____   ____  ____   ____  _____      _____
--  ___|\    \  |    | |    |/                 \/                 \ ___|\    \  |    | |    ||    | |    ||\    \    /    /|
-- |    |\    \ |    | |    |\______     ______/\______     ______//    /\    \ |    | |    ||    | |    || \    \  /    / |
-- |    | |    ||    | |    |   \( /    /  )/      \( /    /  )/  |    |  |    ||    |_|    ||    |_|    ||  \____\/    /  /
-- |    | |    ||    | |    |    ' |   |   '        ' |   |   '   |    |  |____||    .-.    ||    .-.    | \ |    /    /  /
-- |    | |    ||    | |    |      |   |              |   |       |    |   ____ |    | |    ||    | |    |  \|___/    /  /
-- |    | |    ||    | |    |     /   //             /   //       |    |  |    ||    | |    ||    | |    |      /    /  /
-- |____|/____/||\___\_|____|    /___//             /___//        |\ ___\/    /||____| |____||____| |____|     /____/  /
-- |    /    | || |    |    |   |`   |             |`   |         | |   /____/ ||    | |    ||    | |    |    |`    | /
-- |____|____|/  \|____|____|   |____|             |____|          \|___|    | /|____| |____||____| |____|    |_____|/
--   \(    )/       \(   )/       \(                 \(              \( |____|/   \(     )/    \(     )/         )/
--    '    '         '   '         '                  '               '   )/       '     '      '     '          '

-- [[ Globals & Bootstrap ]]
-- Leader must be set before plugin/ scripts are sourced
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.loader.enable() -- Lua bytecode cache for faster startup

-- ==============================
-- NetRW
-- ==============================
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- ==============================
-- BASIC SETTINGS
-- ==============================
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.wrap = true
vim.o.breakindent = true
vim.o.updatetime = 50
vim.o.confirm = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true

-- ==============================
-- TAB AND INDENTATION
-- ==============================
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.backspace = "indent,eol,start"

-- ==============================
-- TEXT / FORMATTING
-- ==============================
vim.o.textwidth = 100
vim.opt.formatoptions:append("r")

-- ==============================
-- LIST AND DISPLAY CHARACTERS
-- ==============================
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- ==============================
-- SEARCH
-- ==============================
vim.o.hlsearch = true -- highlight matches
vim.o.incsearch = true -- show matches as you type
vim.o.inccommand = "split" -- live preview of :%s/replace
vim.o.showmatch = true -- jump to matching paren/brace
vim.o.ignorecase = true
vim.o.smartcase = true

-- ==============================
-- COLOURS AND UI
-- ==============================
vim.o.termguicolors = true
vim.o.title = true
vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.laststatus = 3
vim.o.pumblend = 10
vim.o.winblend = 10
vim.o.smoothscroll = true

-- ==============================
-- FILE HANDLING
-- ==============================
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

-- ==============================
-- NEOVIDE (GUI)
-- ==============================
if vim.g.neovide then
	local neovide_font_size = 12
	local font_candidates = {
		"MesloLGS NF",
		"JetBrainsMono Nerd Font",
		"JetBrainsMonoNL Nerd Font",
		"FiraCode Nerd Font",
		"Hack Nerd Font",
		"Noto Sans Mono",
		"Monospace",
	}

	local selected_font = font_candidates[#font_candidates]
	if vim.fn.executable("fc-list") == 1 then
		local out = vim.fn.system({ "fc-list", ":", "family" })
		for _, font_name in ipairs(font_candidates) do
			if out:find(font_name, 1, true) then
				selected_font = font_name
				break
			end
		end
	else
		selected_font = font_candidates[1]
	end

	vim.o.guifont = string.format("%s:h%d", selected_font, neovide_font_size)
end

-- [[ Clipboard ]]
-- Deferred to avoid startup slowdown
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- [[ Plugins ]]
-- Plugin files live in plugin/ and are sourced automatically by Neovim.
-- Run :lua vim.pack.update() to update all plugins.

require("keymaps")
