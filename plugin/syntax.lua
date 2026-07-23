-- Treesitter context UI on top of Neovim 0.12 built-in treesitter.

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("treesitter-context").setup({ max_lines = 3 })

local parsers_to_install = {
	"css",
	"html",
	"go",
	"python",
	"java",
	"javascript",
	"typescript",
	"json",
	"scss",
}

for _, lang in ipairs(parsers_to_install) do
	local ok = pcall(vim.treesitter.language.add, lang)
	if not ok then
		vim.treesitter.install(lang)
	end
end
