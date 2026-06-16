--       :::::::::  :::    ::: ::::::::::: ::::::::::: ::::::::  :::    ::: :::    ::: :::   :::
--     :+:    :+: :+:    :+:     :+:         :+:    :+:    :+: :+:    :+: :+:    :+: :+:   :+:
--    +:+    +:+ +:+    +:+     +:+         +:+    +:+        +:+    +:+ +:+    +:+  +:+ +:+
--   +#+    +:+ +#+    +:+     +#+         +#+    +#+        +#++:++#++ +#++:++#++   +#++:
--  +#+    +#+ +#+    +#+     +#+         +#+    +#+        +#+    +#+ +#+    +#+    +#+
-- #+#    #+# #+#    #+#     #+#         #+#    #+#    #+# #+#    #+# #+#    #+#    #+#
--#########   ########      ###         ###     ########  ###    ### ###    ### ###

-- ================================================================================
-- GLOBALS & BOOTSTRAP
-- ================================================================================
-- Set the leader key to space - used as prefix for custom keybindings
vim.g.mapleader = " "
-- Set the local leader key to space - used for buffer-local keybindings
vim.g.maplocalleader = " "
-- Enable Lua bytecode cache for faster startup times
vim.loader.enable()
-- Flag indicating that Nerd Fonts are available (enables icon rendering)
vim.g.have_nerd_font = true

-- ================================================================================
-- DISABLED PROVIDERS (Performance)
-- ================================================================================
-- Disable Node.js provider to reduce startup time if not needed
vim.g.loaded_node_provider = 0
-- Disable Python 3 provider to reduce startup time if not needed
vim.g.loaded_python3_provider = 0
-- Disable Perl provider to reduce startup time if not needed
vim.g.loaded_perl_provider = 0
-- Disable Ruby provider to reduce startup time if not needed
vim.g.loaded_ruby_provider = 0

-- ================================================================================
-- BASIC EDITOR SETTINGS
-- ================================================================================
-- Display absolute line numbers on the left gutter
vim.o.number = true
-- Display relative line numbers for easier motion calculations
vim.o.relativenumber = true
-- Highlight the current cursor line for better visibility
vim.o.cursorline = true
-- Always show 8 lines above/below cursor when scrolling (padding)
vim.o.scrolloff = 8
-- Enable word wrapping for long lines
vim.o.wrap = true
-- Wrapped lines maintain indentation of the parent line
vim.o.breakindent = true
-- Update UI after 50ms of inactivity (used for cursor tracking plugins)
vim.o.updatetime = 50
-- Ask for confirmation instead of failing on unsaved buffer operations
vim.o.confirm = true
-- Enable mouse support in all modes
vim.o.mouse = "a"
-- Don't show -- INSERT -- status in command line (handled by statusline)
vim.o.showmode = false
-- Always show sign column (used for diagnostics, breakpoints, etc.)
vim.o.signcolumn = "yes"
-- Wait 300ms for completion of key sequences before timing out
vim.o.timeoutlen = 300

-- ================================================================================
-- SPLIT AND WINDOW BEHAVIOR
-- ================================================================================
-- New splits open to the right of current window
vim.o.splitright = true
-- New splits open below current window
vim.o.splitbelow = true

-- ================================================================================
-- TABS AND INDENTATION
-- ================================================================================
-- Number of spaces a TAB character represents
vim.o.tabstop = 4
-- Number of spaces TAB key inserts in insert mode
vim.o.softtabstop = 4
-- Number of spaces for each indentation level
vim.o.shiftwidth = 4
-- Convert TAB characters to spaces
vim.o.expandtab = true
-- Automatically indent new lines based on context
vim.o.smartindent = true
-- TAB key respects 'tabstop', 'softtabstop', and 'shiftwidth'
vim.o.smarttab = true
-- Backspace deletes indentation, line breaks, and inserted characters
vim.o.backspace = "indent,eol,start"

-- ================================================================================
-- TEXT FORMATTING
-- ================================================================================
-- Maximum line length before wrapping (used by formatters)
vim.o.textwidth = 100
-- Auto-insert comment leader after hitting <Enter> in comment
vim.opt.formatoptions:append("r")

-- ================================================================================
-- LIST AND DISPLAY CHARACTERS
-- ================================================================================
-- Show whitespace characters as special symbols
vim.o.list = true
-- Configure which whitespace characters to display:
-- tab: » (double angle) for tabs
-- trail: · (middle dot) for trailing spaces
-- nbsp: ␣ (open box) for non-breaking spaces
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- ================================================================================
-- SEARCH BEHAVIOR
-- ================================================================================
-- Highlight all matches for the last search pattern
vim.o.hlsearch = true
-- Show matches as you type the search pattern
vim.o.incsearch = true
-- Show a split window preview of substitution (:s) operations in real-time
vim.o.inccommand = "split"
-- Briefly jump to matching brackets when they're inserted
vim.o.showmatch = true
-- Search is case-insensitive by default
vim.o.ignorecase = true
-- Search becomes case-sensitive if uppercase letters are used
vim.o.smartcase = true

-- ================================================================================
-- COLORS AND UI
-- ================================================================================
-- Enable 24-bit true color support in the terminal
vim.o.termguicolors = true
-- Use filename as the terminal window title
vim.o.title = true
-- Show the command being typed in the command line
vim.o.showcmd = true
-- Height of the command line (1 = minimal)
vim.o.cmdheight = 1
-- Single global statusline at bottom instead of one per split (3 = global)
vim.o.laststatus = 3
-- Transparency of popup menu (0-100, higher = more transparent)
vim.o.pumblend = 10
-- Transparency of non-current windows (0-100, higher = more transparent)
vim.o.winblend = 10
-- Enable smooth scrolling animation when using Page Up/Down
vim.o.smoothscroll = true

-- ================================================================================
-- FILE HANDLING
-- ================================================================================
-- Enhanced command-line completion with menu
vim.o.wildmenu = true
-- Complete longest common match first, then show all completions
vim.o.wildmode = "longest:full,full"
-- Don't create .swp files for recovery
vim.o.swapfile = false
-- Don't create backup files (.bak)
vim.o.backup = false
-- Maintain undo history across sessions in .undodir
vim.o.undofile = true

-- Register custom file type for MDX (Markdown + JSX)
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})

-- ================================================================================
-- CLIPBOARD (Deferred to avoid startup slowdown)
-- ================================================================================
-- Schedule clipboard integration to load after startup completes
-- This uses the system clipboard for all yank/paste operations
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- ================================================================================
-- NETRW FILE BROWSER
-- ================================================================================
-- Use detailed list style (vs compact or tree view)
vim.g.netrw_liststyle = 3
-- Don't split window when opening files, open in current window
vim.g.netrw_browse_split = 0
-- Hide the banner with help text at the top of file browser
vim.g.netrw_banner = 0
-- Width of the netrw window as percentage of editor width
vim.g.netrw_winsize = 25

-- ================================================================================
-- NEOVIDE GUI CONFIGURATION
-- ================================================================================
-- Only execute this block if running in Neovide GUI
if vim.g.neovide then
	-- Font size in points
	local neovide_font_size = 12
	-- List of preferred fonts in order of preference (uses first available)
	local font_candidates = {
		"MesloLGS NF",
		"JetBrainsMono Nerd Font",
		"JetBrainsMonoNL Nerd Font",
		"FiraCode Nerd Font",
		"Hack Nerd Font",
		"Noto Sans Mono",
		"Monospace",
	}

	-- Default to last font if fc-list is not available
	local selected_font = font_candidates[#font_candidates]
	-- Try to detect installed fonts using fc-list command
	if vim.fn.executable("fc-list") == 1 then
		-- Get list of all installed fonts
		local out = vim.fn.system({ "fc-list", ":", "family" })
		-- Search for fonts in our preference list
		for _, font_name in ipairs(font_candidates) do
			-- Use first available preferred font
			if out:find(font_name, 1, true) then
				selected_font = font_name
				break
			end
		end
	else
		-- If fc-list not available, use first candidate
		selected_font = font_candidates[1]
	end

	-- Apply the selected font and size to Neovide
	vim.o.guifont = string.format("%s:h%d", selected_font, neovide_font_size)
end

-- ================================================================================
-- AUTOCOMMANDS
-- ================================================================================
-- Highlight text briefly when it's copied/yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	-- Create an autogroup for easy management (clear existing commands in this group)
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		-- Call Neovim's built-in highlight function
		vim.hl.hl_op()
	end,
})

-- ================================================================================
-- KEYMAPS
-- ================================================================================
-- Load custom keybindings from separate keymaps module
require("keymaps")

-- ================================================================================
-- PLUGINS
-- ================================================================================
-- Plugins are sourced automatically by Neovim on startup.
-- Run :lua vim.pack.update() to update all plugins.
