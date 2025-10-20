return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>Ut", function() end, desc = "Toggle terminal (bottom)" },
      { "<leader>Uf", function() end, desc = "Toggle floating terminal" },
    },
    opts = {
      size = 15, -- default terminal height
      open_mapping = false, -- we’ll handle keymaps manually
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      insert_mappings = true,
      direction = "horizontal",
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
    },
    config = function(_, opts)
      local toggleterm = require("toggleterm")
      toggleterm.setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      -- Bottom terminal (horizontal)
      local bottom_term = Terminal:new({
        direction = "horizontal",
        hidden = true,
        close_on_exit = false,
        cwd = vim.fn.getcwd(),
      })

      -- Floating terminal
      local float_term = Terminal:new({
        direction = "float",
        hidden = true,
        close_on_exit = false,
        float_opts = { border = "rounded" },
        cwd = vim.fn.getcwd(),
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>Ut", function()
        bottom_term:toggle()
      end, { desc = "Toggle terminal (bottom)" })

      vim.keymap.set("n", "<leader>Uf", function()
        float_term:toggle()
      end, { desc = "Toggle floating terminal" })
    end,
  },
}
