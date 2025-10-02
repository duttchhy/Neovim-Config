-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local sorters = require("telescope.sorters")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        file_ignore_patterns = { ".git/", "node_modules/", "__pycache__/" },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
        },
      },
    })

    -- Keymaps
    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>ff', builtin.find_files, vim.tbl_extend("force", opts, { desc = "Telescope find files" }))
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, vim.tbl_extend("force", opts, { desc = "Telescope live grep" }))
    vim.keymap.set('n', '<leader>fb', builtin.buffers, vim.tbl_extend("force", opts, { desc = "Telescope buffers" }))
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, vim.tbl_extend("force", opts, { desc = "Telescope help tags" }))
  end,
}
