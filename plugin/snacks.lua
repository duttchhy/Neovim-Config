-- Snacks: loaded early (01- prefix) so its picker is available to other plugins.
vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", version = "master" },
	"https://github.com/folke/snacks.nvim",
})

---@type snacks.Config
require("snacks").setup({
	animate = { enabled = true },
	explorer = { enabled = true },
	-- input: enhances opencode.nvim's ask() prompt
	input = { enabled = true },
	picker = {
		enabled = true,
		-- opencode.nvim: send selected file/item to opencode via <A-a>
		actions = {
			opencode_send = function(...)
				return require("opencode").snacks_picker_send(...)
			end,
		},
		win = {
			input = {
				keys = {
					["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
				},
			},
		},
	},
	project = {
		dirs = {
			"~/github",
			"~/projects",
			"~/build",
		},
	},
	indent = { enabled = true },
	notifier = { enabled = true },
	statuscolumn = { enabled = true },
	zen = { enabled = true },
})

local map = vim.keymap.set
map("n", "<leader>Sh", function()
	Snacks.picker.help()
end, { desc = "[S]earch [H]elp" })
map("n", "<leader>Sk", function()
	Snacks.picker.keymaps()
end, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>Sc", function()
	Snacks.picker.commands()
end, { desc = "[S]earch [C]ommands" })
map("n", "<leader>Sb", function()
	Snacks.picker.builtin()
end, { desc = "[S]earch [B]uiltins" })
map("n", "<leader>Sf", function()
	Snacks.picker.files()
end, { desc = "[S]earch [F]iles" })
map("n", "<leader>fe", function()
	Snacks.explorer.open()
end, { desc = "[F]iles [E]xplorer open tree" })
map("n", "<leader>ff", function()
	Snacks.picker.smart()
end, { desc = "[S]earch [F]iles smart" })
map("n", "<leader>Ss", function()
	Snacks.picker.pickers()
end, { desc = "[S]earch [S]elect Snacks" })
map({ "n", "x" }, "<leader>Sw", function()
	Snacks.picker.grep_word()
end, { desc = "[S]earch current [W]ord" })
map("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "[S]earch by [G]rep" })
map("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "[S]earch [P]rojects" })
map("n", "<leader>Sd", function()
	Snacks.picker.diagnostics()
end, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>Sr", function()
	Snacks.picker.resume()
end, { desc = "[S]earch [R]esume" })
map("n", "<leader>S.", function()
	Snacks.picker.recent()
end, { desc = "[S]earch Recent Files" })
map("n", "<leader><leader>", function()
	Snacks.picker.grep()
end, { desc = "[ ] Fuzzy find" })
map("n", "<leader>/", function()
	Snacks.picker.lines({})
end, { desc = "[/] Fuzzily search in current buffer" })
map("n", "<leader>S/", function()
	Snacks.picker.grep_buffers()
end, { desc = "[S]earch [/] in Open Files" })
map("n", "<leader>Sn", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
map("n", "<leader>SN", function()
	Snacks.zen()
end, { desc = "Toggle [Z]en mode" })
