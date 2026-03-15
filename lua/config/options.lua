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

-- ==============================
-- NetRW
-- ==============================
vim.g.lazyvim_picker = "telescope"
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
vim.o.mouse = ""
vim.o.confirm = true

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

-- ==============================
-- COLOURS AND UI
-- ==============================
vim.o.termguicolors = true
vim.o.title = true
vim.o.showcmd = true
vim.o.cmdheight = 1 -- Only set if not using 0.8+ behavior
vim.o.laststatus = 3

-- ==============================
-- FILE HANDLING
-- ==============================
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.swapfile = false
vim.o.backup = false
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

-- ==============================
-- UNDOTREE / UNDO HISTORY
-- ==============================
local undodir = vim.fn.stdpath("state") .. "/undo"

if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.o.undodir = undodir
vim.o.undofile = true

-- ==============================
-- OTHER
-- ==============================
vim.opt.isfname:append("@-@")

-- ==============================
-- KEYMAPS
-- ==============================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlight

-- Undotree toggle keybind
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle UndoTree" })

-- ==============================
-- TERMINAL
-- ==============================
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
