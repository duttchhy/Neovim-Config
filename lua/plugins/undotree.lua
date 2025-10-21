return {
  "mbbill/undotree",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

    -- 💡 Patch: prevent Neovim signcolumn crash in undotree
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "undotree",
      callback = function()
        -- Disable diagnostics and signcolumn
        vim.diagnostic.enable(false)
        vim.wo.signcolumn = "no"
      end,
    })
  end,
}
