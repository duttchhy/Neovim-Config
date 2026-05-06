return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- FIX: removed the `keys` table that mapped <leader>Ut and <leader>Uf to empty no-ops.
    -- Those stubs fired on keypress and prevented the plugin from ever lazy-loading.
    -- The real keymaps are registered in the config function below.
    lazy = true,
    opts = {
      size = 15, -- default terminal height
      open_mapping = false, -- we'll handle keymaps manually
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
