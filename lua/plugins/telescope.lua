-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        layout_strategy = "horizontal",
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

