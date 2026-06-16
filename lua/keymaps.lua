--       :::::::::  :::    ::: ::::::::::: ::::::::::: ::::::::  :::    ::: :::    ::: :::   :::
--     :+:    :+: :+:    :+:     :+:         :+:    :+:    :+: :+:    :+: :+:    :+: :+:   :+:
--    +:+    +:+ +:+    +:+     +:+         +:+    +:+        +:+    +:+ +:+    +:+  +:+ +:+
--   +#+    +:+ +#+    +:+     +#+         +#+    +#+        +#++:++#++ +#++:++#++   +#++:
--  +#+    +#+ +#+    +#+     +#+         +#+    +#+        +#+    +#+ +#+    +#+    +#+
-- #+#    #+# #+#    #+#     #+#         #+#    #+#    #+# #+#    #+# #+#    #+#    #+#
--#########   ########      ###         ###     ########  ###    ### ###    ###    ###
-- Keymapping Configuration

-- ================================================================================
-- SETUP & DEFAULTS
-- ================================================================================
-- Shorthand for vim.keymap.set to reduce boilerplate
local keymap = vim.keymap.set
-- Default options for keymaps: prevent remapping and suppress echo
local opts = { noremap = true, silent = true }

-- ================================================================================
-- CORE EDITOR COMMANDS
-- ================================================================================
-- Close current buffer with confirmation prompt to prevent accidental quits
keymap("n", "<leader>qq", ":confirm q<CR>", vim.tbl_extend("force", opts, { desc = "Quit current buffer (confirm)" }))
-- Close all buffers with confirmation prompt
keymap("n", "<leader>Q", ":confirm qa<CR>", vim.tbl_extend("force", opts, { desc = "Quit all buffers (confirm)" }))
-- Open Oil file explorer for navigation
keymap("n", "<leader>e", function()
	require("oil").open()
end, vim.tbl_extend("force", opts, { desc = "Open file explorer (Oil)" }))

-- ================================================================================
-- MACRO RECORDING REMAPS
-- ================================================================================
-- Disable the default 'q' macro recording key to prevent accidental recordings
keymap("n", "q", "<Nop>", { desc = "Disable default 'q' macro recording" })
-- Move macro recording to <leader>W for explicit, intentional use
keymap("n", "<leader>W", "q", { desc = "Record macro (moved from q to <leader>W)" })

-- ================================================================================
-- VISUAL MODE - MOVEMENT & EDITING
-- ================================================================================
-- Move selected lines down and re-indent
keymap("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down" }))
-- Move selected lines up and re-indent
keymap("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up" }))
-- Alternative: use Shift+Down to move selection down
keymap(
	"v",
	"<S-Down>",
	":m '>+1<CR>gv=gv",
	vim.tbl_extend("force", opts, { desc = "Move selection down (Shift+Down)" })
)
-- Alternative: use Shift+Up to move selection up
keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up (Shift+Up)" }))

-- ================================================================================
-- VISUAL MODE - CLIPBOARD & INDENTATION
-- ================================================================================
-- Paste without overwriting the current clipboard register
keymap("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without overwriting clipboard" }))
-- Dedent selection and keep selection active for further edits
keymap("v", "<", "<gv", vim.tbl_extend("force", opts, { desc = "Dedent and stay in visual mode" }))
-- Indent selection and keep selection active for further edits
keymap("v", ">", ">gv", vim.tbl_extend("force", opts, { desc = "Indent and stay in visual mode" }))

-- ================================================================================
-- NORMAL MODE - LINE OPERATIONS
-- ================================================================================
-- Join lines while maintaining cursor position at original location
keymap("n", "J", "mzJ`z", vim.tbl_extend("force", opts, { desc = "Join lines (keep cursor position)" }))

-- ================================================================================
-- NORMAL MODE - SCROLLING & CENTERING
-- ================================================================================
-- Scroll half-page down and center the view on the cursor
keymap("n", "<C-j>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page down (centered)" }))
-- Scroll half-page up and center the view on the cursor
keymap("n", "<C-k>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page up (centered)" }))
-- Jump to next search match and center view on cursor
keymap("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (centered)" }))
-- Jump to previous search match and center view on cursor
keymap("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (centered)" }))
-- Alternative: Alt+Down jumps to next search match (centered)
keymap("n", "<A-Down>", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (Alt+Down)" }))
-- Alternative: Alt+Up jumps to previous search match (centered)
keymap("n", "<A-Up>", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (Alt+Up)" }))

-- ================================================================================
-- NORMAL MODE - TEXT SELECTION & EDITING HELPERS
-- ================================================================================
-- Re-indent current paragraph while preserving cursor position
keymap("n", "=ap", "ma=ap`a", vim.tbl_extend("force", opts, { desc = "Re-indent paragraph" }))
-- Select all text in the buffer
keymap("n", "<C-a>", "gg<S-v>G", vim.tbl_extend("force", opts, { desc = "Select all text" }))
-- Fix jumplist behavior: Ctrl+m behaves like Ctrl+i (jump forward)
keymap("n", "<C-m>", "<C-i>", vim.tbl_extend("force", opts, { desc = "Fix jumplist (Ctrl+m behaves like Ctrl+i)" }))

-- ================================================================================
-- INSERT MODE
-- ================================================================================
-- Quick escape from insert mode using jj double-tap
keymap("i", "jj", "<ESC>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))

-- ================================================================================
-- SEARCH & HIGHLIGHTING
-- ================================================================================
-- Quick search and replace: S opens substitution prompt for whole buffer
keymap("n", "S", ":%s//g<Left><Left>", { desc = "Search and replace in buffer" })
-- Clear search highlights when pressing Escape
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
-- Alternative: <leader>nh to clear search highlights
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "No Highlight — clear search" })

-- ================================================================================
-- REGISTERS & CLIPBOARD MANAGEMENT
-- ================================================================================
-- Yank to system clipboard using Ctrl+c (works in normal, visual, and select modes)
keymap({ "n", "v", "x" }, "<C-c>", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
-- Yank to system clipboard using <leader>y (priority over treesitter code-block yank)
keymap({ "n", "v" }, "<leader>y", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
-- Cut to system clipboard using Ctrl+x
keymap({ "n", "v", "x" }, "<C-x>", [["+d]], vim.tbl_extend("force", opts, { desc = "Cut to system clipboard" }))
-- Delete to black-hole register (doesn't affect clipboard)
keymap({ "n", "v" }, "<leader>d", '"_d', vim.tbl_extend("force", opts, { desc = "Delete without affecting clipboard" }))

-- ================================================================================
-- BLACK-HOLE REGISTER OPERATIONS
-- ================================================================================
-- Delete single character without yanking it
keymap({ "n", "v" }, "x", '"_x', { desc = "Delete single char silently" })
-- Change selection without yanking the deleted text
keymap({ "n", "v" }, "<Leader>c", '"_c', { desc = "Change without yanking" })
-- Change to end of line without yanking the deleted text
keymap({ "n", "v" }, "<Leader>C", '"_C', { desc = "Change to end without yanking" })
-- Delete to end of line without yanking the deleted text
keymap({ "n", "v" }, "<Leader>D", '"_D', { desc = "Delete to end without yanking" })

-- ================================================================================
-- NUMERIC OPERATIONS
-- ================================================================================
-- Increment number under cursor using + key
keymap("n", "+", "<C-a>", { desc = "Increment number under cursor" })
-- Decrement number under cursor using - key
keymap("n", "-", "<C-x>", { desc = "Decrement number under cursor" })

-- ================================================================================
-- WINDOW & SPLIT MANAGEMENT
-- ================================================================================
-- Create horizontal split
keymap("n", "ss", ":split<Return>", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))
-- Create vertical split
keymap("n", "sv", ":vsplit<Return>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))

-- ================================================================================
-- WINDOW NAVIGATION
-- ================================================================================
-- Move focus to window on the left
keymap("n", "sh", "<C-w>h", { desc = "Move to left window" })
-- Move focus to window above
keymap("n", "sk", "<C-w>k", { desc = "Move to upper window" })
-- Move focus to window below
keymap("n", "sj", "<C-w>j", { desc = "Move to lower window" })
-- Move focus to window on the right
keymap("n", "sl", "<C-w>l", { desc = "Move to right window" })
-- Alternative: Ctrl+h moves focus to left window
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
-- Alternative: Ctrl+l moves focus to right window
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })

-- ================================================================================
-- WINDOW RESIZING
-- ================================================================================
-- Decrease window height by 2 lines
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- Increase window height by 2 lines
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- Decrease window width by 2 columns
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- Increase window width by 2 columns
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- ================================================================================
-- BUFFER MANAGEMENT
-- ================================================================================
-- Force close current buffer without saving
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", vim.tbl_extend("force", opts, { desc = "Force close buffer" }))

-- ================================================================================
-- BUFFER LINE NAVIGATION (BufferLine plugin)
-- ================================================================================
-- Open buffer picker to quickly switch buffers
keymap("n", "<leader>bp", "<cmd>BufferLinePick<CR>", vim.tbl_extend("force", opts, { desc = "Pick buffer" }))
-- Open buffer picker to select a buffer to close
keymap(
	"n",
	"<leader>bc",
	"<cmd>BufferLinePickClose<CR>",
	vim.tbl_extend("force", opts, { desc = "Pick buffer to close" })
)
-- Cycle to previous buffer (to the left in buffer line)
keymap("n", "<leader>bh", "<cmd>BufferLineCyclePrev<CR>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))
-- Cycle to next buffer (to the right in buffer line)
keymap("n", "<leader>bl", "<cmd>BufferLineCycleNext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
-- Move current buffer to the left in the buffer line
keymap("n", "<leader>bH", "<cmd>BufferLineMovePrev<CR>", vim.tbl_extend("force", opts, { desc = "Move buffer prev" }))
-- Move current buffer to the right in the buffer line
keymap("n", "<leader>bL", "<cmd>BufferLineMoveNext<CR>", vim.tbl_extend("force", opts, { desc = "Move buffer next" }))

-- ================================================================================
-- BUFFER LINE INDEXED NAVIGATION
-- ================================================================================
-- Go to specific buffer by index (1-9)
for i = 1, 9 do
	keymap(
		"n",
		"<leader>b" .. i,
		"<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
		vim.tbl_extend("force", opts, { desc = "Go to buffer " .. i })
	)
end
-- Go to last buffer using <leader>b0
keymap(
	"n",
	"<leader>b0",
	"<cmd>BufferLineGoToBuffer -1<CR>",
	vim.tbl_extend("force", opts, { desc = "Go to last buffer" })
)

-- ================================================================================
-- BUFFER CLOSING WITH SAVE PROMPT
-- ================================================================================
-- Close buffer with confirmation if it has unsaved changes
keymap("n", "<leader>bq", function()
	local buf = vim.api.nvim_get_current_buf()
	-- Check if buffer has modifications
	if vim.bo.modified then
		-- Prompt user to save, discard, or cancel
		local choice = vim.fn.confirm("Buffer has unsaved changes. Save before closing?", "&Yes\n&No\n&Cancel", 1)
		if choice == 1 then
			-- Save the buffer
			vim.cmd("write")
		elseif choice == 3 then
			-- Cancel: return without closing
			return
		end
		-- If choice == 2 (No), continue to delete without saving
	end
	-- Delete the buffer
	vim.api.nvim_buf_delete(buf, {})
end, { desc = "Close buffer (prompt to save)" })

-- ================================================================================
-- BUFFER SPLITS
-- ================================================================================
-- Split current buffer horizontally
keymap("n", "<leader>bs", "<cmd>split<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer horizontally" }))
-- Split current buffer vertically
keymap("n", "<leader>bv", "<cmd>vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer vertically" }))

-- ================================================================================
-- TAB MANAGEMENT
-- ================================================================================
-- Create a new tab
keymap("n", "<leader>t", "<cmd>tabnew<CR>", vim.tbl_extend("force", opts, { desc = "New tab" }))
-- Close current tab
keymap("n", "<A-q>", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close tab" }))

-- ================================================================================
-- DIAGNOSTICS
-- ================================================================================
-- Open diagnostic quickfix list for current buffer
keymap("n", "<leader>xq", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- ================================================================================
-- TERMINAL MODE
-- ================================================================================
-- Exit terminal mode and return to normal mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ================================================================================
-- PLUGIN SHORTCUTS
-- ================================================================================
-- Open Alpha dashboard (home/start screen)
keymap("n", "<leader>A", ":Alpha<CR>", vim.tbl_extend("force", opts, { desc = "Open Alpha dashboard" }))
-- Paste image from clipboard into document
keymap("n", "<leader>p", "<cmd>PasteImage<CR>", vim.tbl_extend("force", opts, { desc = "Paste image from clipboard" }))
-- Toggle Undotree panel for undo history visualization
keymap(
	"n",
	"<F5>",
	"<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>",
	vim.tbl_extend("force", opts, { desc = "Toggle Undotree" })
)

-- ================================================================================
-- COMMENT TOGGLE REMAPPING
-- ================================================================================
-- Remap comment keybindings from gc/gcc to <leader>/ for consistency
-- This section preserves the original comment plugin functionality while using a custom binding
do
	-- Get the original mapping for gc (toggle comment on selection)
	local n_gc = vim.fn.maparg("gc", "n", false, true)
	-- Get the original mapping for gcc (toggle comment on current line)
	local n_gcc = vim.fn.maparg("gcc", "n", false, true)
	-- Get the original mapping for gc in visual mode
	local x_gc = vim.fn.maparg("gc", "x", false, true)

	-- If gcc has a callback, map <leader>/ to toggle comment on line
	if type(n_gcc) == "table" and n_gcc.callback then
		keymap("n", "<leader>/", n_gcc.callback, { desc = "Toggle comment line" })
	-- Otherwise use gc's callback if available
	elseif type(n_gc) == "table" and n_gc.callback then
		keymap("n", "<leader>/", n_gc.callback, { desc = "Toggle comment" })
	end

	-- If visual mode gc has a callback, map <leader>/ to toggle comment on selection
	if type(x_gc) == "table" and x_gc.callback then
		keymap("x", "<leader>/", x_gc.callback, { desc = "Toggle comment selection" })
	end

	-- Remove the original gc and gcc keymaps to avoid confusion
	pcall(vim.keymap.del, "n", "gc")
	pcall(vim.keymap.del, "n", "gcc")
	pcall(vim.keymap.del, "x", "gc")
end

-- ================================================================================
-- URL CLICK HANDLER
-- ================================================================================
-- Helper function: search for a URL in a line at a specific column
local function url_in_line_at_col(line, col)
	-- Return nil if line or column is invalid
	if not line or line == "" or not col or col < 1 then
		return nil
	end
	local from = 1
	-- Search for http(s) URLs in the line
	while true do
		-- Find next URL starting with http:// or https://
		local s, e = line:find("https?://%S+", from)
		if not s then
			-- No more URLs found
			return nil
		end
		-- Check if cursor position is within this URL
		if col >= s and col <= e then
			-- Extract URL and remove trailing punctuation that's likely not part of URL
			local url = line:sub(s, e):gsub('[%]%)%}%.,;:!%?"' .. "'" .. "]+$", "")
			return url ~= "" and url or nil
		end
		-- Continue searching from end of current URL
		from = e + 1
	end
end

-- Left-click handler: open URLs or fall back to default click behavior
keymap("n", "<LeftMouse>", function()
	-- Get mouse position
	local m = vim.fn.getmousepos()
	-- Validate mouse position data
	if m.winid and m.winid ~= 0 and m.line and m.column and m.line > 0 and m.column > 0 then
		-- Safely get the buffer number from the window
		local ok_buf, bufnr = pcall(vim.api.nvim_win_get_buf, m.winid)
		if ok_buf and bufnr then
			-- Safely get the line content at cursor position
			local ok_line, lines = pcall(vim.api.nvim_buf_get_lines, bufnr, m.line - 1, m.line, false)
			if ok_line then
				-- Search for URL at click position
				local target = url_in_line_at_col(lines[1] or "", m.column)
				if target then
					-- Open URL in default browser
					vim.ui.open(target)
					return
				end
			end
		end
	end
	-- Fall back to default left-click behavior if no URL found
	vim.api.nvim_feedkeys(vim.keycode("<LeftMouse>"), "n", false)
end, { desc = "Click URL to open in browser" })
