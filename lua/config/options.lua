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

vim.g.lazyvim_picker = "telescope"
-- ==============================
-- BASIC SETTINGS
-- ==============================
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.wrap = false
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
vim.o.smartindent = true       -- better than just `autoindent`
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.backspace = { "start", "eol", "indent" }

-- ==============================
-- TEXT / FORMATTING
-- ==============================
vim.o.textwidth = 80           -- auto-wrap text at 80 cols
vim.opt.formatoptions:append({ "r" })   -- Continue block comments with `*`

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
vim.opt.ignorecase = true 

-- ==============================
-- COLOURS AND UI
-- ==============================
vim.o.termguicolors = true
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1           -- Only set if not using 0.8+ behavior
vim.opt.laststatus = 3
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
local undodir = os.getenv("HOME") .. "/.vim/undodir"
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
vim.o.undodir = undodir
vim.o.undofile = true

-- ==============================
-- OTHER
-- ==============================
vim.opt.isfname:append("@-@")  -- allow '@-@' in filenames
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- ==============================
-- KEYMAPS
-- ==============================
--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
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
vim.keymap.set("i", "<", "<><Left>")

-- ==============================
-- TERMINAL
-- ==============================
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

