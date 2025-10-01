--__________                        
--\______   \____________    _____  
-- |    |  _/\_  __ \__  \  /     \ 
-- |    |   \ |  | \// __ \|  Y Y  \
-- |______  / |__|  (____  /__|_|  /
--        \/             \/      \/ 
-- Initial Test
-- print("Pee Pee Poo Poo")
--
--Basic Settings:
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.relativenumber = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.confirm = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Add my plugins
require("bram.remap")
require("bram.colors")()
-- FF
local wk = require("which-key")
wk.register({
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
  },
}, { prefix = "<leader>" })

