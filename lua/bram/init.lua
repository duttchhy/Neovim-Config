--__________                        
--\______   \____________    _____  
-- |    |  _/\_  __ \__  \  /     \ 
-- |    |   \ |  | \// __ \|  Y Y  \
-- |______  / |__|  (____  /__|_|  /
--        \/             \/      \/ 
-- Initial Test
-- print("Pee Pee Poo Poo")

-- ==============================
-- BASIC SETTINGS
-- ==============================
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
-- vim.o.cursorcolumn = true     -- vertical highlight of cursor column
vim.o.scrolloff = 8
vim.o.wrap = false
vim.o.breakindent = true
vim.o.updatetime = 50
vim.o.mouse = 'a'
vim.o.confirm = true

-- ==============================
-- TAB AND INDENTATION
-- ==============================
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true       -- better than just `autoindent`

-- ==============================
-- TEXT / FORMATTING
-- ==============================
vim.o.textwidth = 80           -- auto-wrap text at 80 cols
--vim.o.colorcolumn = "80"      -- visible margin if you want instead of wrap

-- ==============================
-- LIST AND DISPLAY CHARACTERS
-- ==============================
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- ==============================
-- SEARCH
-- ==============================
vim.o.hlsearch = true          -- highlight matches
vim.o.incsearch = true         -- show matches as you type
vim.o.inccommand = 'split'     -- live preview of :%s/replace

vim.o.showmatch = true         -- jump to matching paren/brace

-- ==============================
-- COLOURS AND UI
-- ==============================
vim.o.termguicolors = true
--vim.o.signcolumn = "yes"

-- ==============================
-- FILE HANDLING
-- ==============================
vim.o.swapfile = false
vim.o.backup = false

-- ==============================
-- UNDOTREE / UNDO HISTORY
-- ==============================
local undodir = os.getenv("HOME") .. "/vim/undodir"
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
vim.o.undodir = undodir
vim.o.undofile = true

-- ==============================
-- OTHER
-- ==============================
vim.opt.isfname:append("@-@")  -- allow '@-@' in filenames

-- ==============================
-- KEYMAPS
-- ==============================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')  -- clear search highlight

-- Undotree toggle keybind
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = "Toggle UndoTree" })

-- ==============================
-- AUTO PAIRS 
-- ==============================
vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")

vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O", { noremap = true, silent = true })
vim.keymap.set("i", "{;<CR>", "{<CR>};<ESC>O", { noremap = true, silent = true })

-- ==============================
-- PLUGINS
-- ==============================
require("bram.remap")
require("bram.colors")()

