--       :::::::::  :::    ::: ::::::::::: ::::::::::: ::::::::  :::    ::: :::    ::: :::   :::
--     :+:    :+: :+:    :+:     :+:         :+:    :+:    :+: :+:    :+: :+:    :+: :+:   :+:
--    +:+    +:+ +:+    +:+     +:+         +:+    +:+        +:+    +:+ +:+    +:+  +:+ +:+
--   +#+    +:+ +#+    +:+     +#+         +#+    +#+        +#++:++#++ +#++:++#++   +#++:
--  +#+    +#+ +#+    +#+     +#+         +#+    +#+        +#+    +#+ +#+    +#+    +#+
-- #+#    #+# #+#    #+#     #+#         #+#    #+#    #+# #+#    #+# #+#    #+#    #+#
--#########   ########      ###         ###     ########  ###    ### ###    ###    ###
-- Keymapping Configuration

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================
-- Personal Remaps
-- ============================================================
keymap("n", "<leader>qq", ":confirm q<CR>", vim.tbl_extend("force", opts, { desc = "Quit current buffer (confirm)" }))
keymap("n", "<leader>Q", ":confirm qa<CR>", vim.tbl_extend("force", opts, { desc = "Quit all buffers (confirm)" }))
keymap("n", "<leader>e", function()
	require("oil").open()
end, vim.tbl_extend("force", opts, { desc = "Open file explorer (Oil)" }))
keymap("n", "q", "<Nop>", { desc = "Disable default 'q' macro recording" })
keymap("n", "<leader>W", "q", { desc = "Record macro (moved from q to <leader>W)" })

-- ============================================================
-- Visual Mode
-- ============================================================
keymap("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down" }))
keymap("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up" }))
keymap(
	"v",
	"<S-Down>",
	":m '>+1<CR>gv=gv",
	vim.tbl_extend("force", opts, { desc = "Move selection down (Shift+Down)" })
)
keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up (Shift+Up)" }))

-- Paste without overwriting clipboard (CTT addition)
keymap("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without overwriting clipboard" }))
-- Indent/dedent and stay in visual mode (CTT addition)
keymap("v", "<", "<gv", vim.tbl_extend("force", opts, { desc = "Dedent and stay in visual mode" }))
keymap("v", ">", ">gv", vim.tbl_extend("force", opts, { desc = "Indent and stay in visual mode" }))

-- ============================================================
-- Normal Mode
-- ============================================================
keymap("n", "J", "mzJ`z", vim.tbl_extend("force", opts, { desc = "Join lines (keep cursor position)" }))
-- <C-j>/<C-k>: your half-page scroll bindings take priority over CTT's window navigation
keymap("n", "<C-j>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page down (centered)" }))
keymap("n", "<C-k>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half-page up (centered)" }))
keymap("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (centered)" }))
keymap("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (centered)" }))
keymap("n", "<A-Down>", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result (Alt+Down)" }))
keymap("n", "<A-Up>", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result (Alt+Up)" }))

-- ============================================================
-- Editing Helpers
-- ============================================================
keymap("n", "=ap", "ma=ap`a", vim.tbl_extend("force", opts, { desc = "Re-indent paragraph" }))
keymap("n", "<C-a>", "gg<S-v>G", vim.tbl_extend("force", opts, { desc = "Select all text" }))
keymap("n", "<C-m>", "<C-i>", vim.tbl_extend("force", opts, { desc = "Fix jumplist (Ctrl+m behaves like Ctrl+i)" }))

-- Insert mode escape (CTT addition)
keymap("i", "jj", "<ESC>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))

-- Search and replace shorthand (CTT addition)
keymap("n", "S", ":%s//g<Left><Left>", { desc = "Search and replace in buffer" })

-- Clear search highlights (CTT addition)
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "No Highlight — clear search" })

-- ============================================================
-- Registers / Clipboard
-- ============================================================
keymap({ "n", "v", "x" }, "<C-c>", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
-- <leader>y: your clipboard yank takes priority over CTT's treesitter code-block yank
keymap({ "n", "v" }, "<leader>y", [["+y]], vim.tbl_extend("force", opts, { desc = "Yank to system clipboard" }))
keymap({ "n", "v", "x" }, "<C-x>", [["+d]], vim.tbl_extend("force", opts, { desc = "Cut to system clipboard" }))
-- <leader>d: your black-hole delete takes priority over CTT's bdelete (bdelete moved to <S-q> below)
keymap({ "n", "v" }, "<leader>d", '"_d', vim.tbl_extend("force", opts, { desc = "Delete without affecting clipboard" }))

keymap({ "n", "v" }, "x", '"_x', { desc = "Delete single char silently" })
keymap({ "n", "v" }, "<Leader>c", '"_c', { desc = "Change without yanking" })
keymap({ "n", "v" }, "<Leader>C", '"_C', { desc = "Change to end without yanking" })
keymap({ "n", "v" }, "<Leader>D", '"_D', { desc = "Delete to end without yanking" })

-- ============================================================
-- Numeric Controls
-- ============================================================
keymap("n", "+", "<C-a>", { desc = "Increment number under cursor" })
-- '-' kept as decrement; Oil's open-parent is available via <leader>o and the '-' in oil buffers
keymap("n", "-", "<C-x>", { desc = "Decrement number under cursor" })

-- ============================================================
-- Splits & Windows
-- ============================================================
keymap("n", "ss", ":split<Return>", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))
keymap("n", "sv", ":vsplit<Return>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
keymap("n", "sh", "<C-w>h", { desc = "Move to left window" })
keymap("n", "sk", "<C-w>k", { desc = "Move to upper window" })
keymap("n", "sj", "<C-w>j", { desc = "Move to lower window" })
keymap("n", "sl", "<C-w>l", { desc = "Move to right window" })

-- Window navigation with Ctrl+arrows (CTT addition; Ctrl+hjkl kept as scroll/window above)
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })

-- Window resize (CTT addition)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- ============================================================
-- Buffer & Tab Navigation (CTT additions)
-- ============================================================
-- <leader>d is your black-hole delete (above); buffer close moved to <S-q>
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", vim.tbl_extend("force", opts, { desc = "Force close buffer" }))

-- BufferLine navigation (ported from old config)
keymap("n", "<leader>bp", "<cmd>BufferLinePick<CR>", vim.tbl_extend("force", opts, { desc = "Pick buffer" }))
keymap(
	"n",
	"<leader>bc",
	"<cmd>BufferLinePickClose<CR>",
	vim.tbl_extend("force", opts, { desc = "Pick buffer to close" })
)
keymap("n", "<leader>bh", "<cmd>BufferLineCyclePrev<CR>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))
keymap("n", "<leader>bl", "<cmd>BufferLineCycleNext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
keymap("n", "<leader>bH", "<cmd>BufferLineMovePrev<CR>", vim.tbl_extend("force", opts, { desc = "Move buffer prev" }))
keymap("n", "<leader>bL", "<cmd>BufferLineMoveNext<CR>", vim.tbl_extend("force", opts, { desc = "Move buffer next" }))

-- Go to buffer by index (leader+b1..b9, leader+b0 = last)
for i = 1, 9 do
	keymap(
		"n",
		"<leader>b" .. i,
		"<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
		vim.tbl_extend("force", opts, { desc = "Go to buffer " .. i })
	)
end
keymap(
	"n",
	"<leader>b0",
	"<cmd>BufferLineGoToBuffer -1<CR>",
	vim.tbl_extend("force", opts, { desc = "Go to last buffer" })
)

-- Close buffer with save prompt
keymap("n", "<leader>bq", function()
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo.modified then
		local choice = vim.fn.confirm("Buffer has unsaved changes. Save before closing?", "&Yes\n&No\n&Cancel", 1)
		if choice == 1 then
			vim.cmd("write")
		elseif choice == 3 then
			return
		end
	end
	vim.api.nvim_buf_delete(buf, {})
end, { desc = "Close buffer (prompt to save)" })

-- Buffer splits
keymap("n", "<leader>bs", "<cmd>split<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer horizontally" }))
keymap("n", "<leader>bv", "<cmd>vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Split buffer vertically" }))

keymap("n", "<leader>t", "<cmd>tabnew<CR>", vim.tbl_extend("force", opts, { desc = "New tab" }))
keymap("n", "<A-q>", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close tab" }))

-- ============================================================
-- Diagnostics (CTT addition)
-- ============================================================
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- ============================================================
-- Terminal (CTT addition)
-- ============================================================
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================================
-- Tools & Plugins (CTT additions)
-- ============================================================
keymap("n", "<leader>a", ":Alpha<CR>", vim.tbl_extend("force", opts, { desc = "Open Alpha dashboard" }))
keymap("n", "<leader>p", "<cmd>PasteImage<CR>", vim.tbl_extend("force", opts, { desc = "Paste image from clipboard" }))
keymap(
	"n",
	"<F5>",
	"<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>",
	vim.tbl_extend("force", opts, { desc = "Toggle Undotree" })
)

-- ============================================================
-- Comments — remap gc/gcc to <leader>/ (CTT addition)
-- ============================================================
do
	local n_gc = vim.fn.maparg("gc", "n", false, true)
	local n_gcc = vim.fn.maparg("gcc", "n", false, true)
	local x_gc = vim.fn.maparg("gc", "x", false, true)

	if type(n_gcc) == "table" and n_gcc.callback then
		keymap("n", "<leader>/", n_gcc.callback, { desc = "Toggle comment line" })
	elseif type(n_gc) == "table" and n_gc.callback then
		keymap("n", "<leader>/", n_gc.callback, { desc = "Toggle comment" })
	end

	if type(x_gc) == "table" and x_gc.callback then
		keymap("x", "<leader>/", x_gc.callback, { desc = "Toggle comment selection" })
	end

	pcall(vim.keymap.del, "n", "gc")
	pcall(vim.keymap.del, "n", "gcc")
	pcall(vim.keymap.del, "x", "gc")
end

-- ============================================================
-- URL click handler (CTT addition)
-- Opens URLs under cursor on left-click; falls back to default click behaviour
-- ============================================================
local function url_in_line_at_col(line, col)
	if not line or line == "" or not col or col < 1 then
		return nil
	end
	local from = 1
	while true do
		local s, e = line:find("https?://%S+", from)
		if not s then
			return nil
		end
		if col >= s and col <= e then
			local url = line:sub(s, e):gsub('[%]%)%}%.,;:!%?"' .. "'" .. "]+$", "")
			return url ~= "" and url or nil
		end
		from = e + 1
	end
end

keymap("n", "<LeftMouse>", function()
	local m = vim.fn.getmousepos()
	if m.winid and m.winid ~= 0 and m.line and m.column and m.line > 0 and m.column > 0 then
		local ok_buf, bufnr = pcall(vim.api.nvim_win_get_buf, m.winid)
		if ok_buf and bufnr then
			local ok_line, lines = pcall(vim.api.nvim_buf_get_lines, bufnr, m.line - 1, m.line, false)
			if ok_line then
				local target = url_in_line_at_col(lines[1] or "", m.column)
				if target then
					vim.ui.open(target)
					return
				end
			end
		end
	end
	vim.api.nvim_feedkeys(vim.keycode("<LeftMouse>"), "n", false)
end, { desc = "Click URL to open in browser" })
