return {
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapContinue", "DapToggleBreakpoint" },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "leoluz/nvim-dap-go",
      {
        "nvim-telescope/telescope-dap.nvim",
        lazy = true,
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local mason_dap = require("mason-nvim-dap")

      mason_dap.setup({
        automatic_installation = true,
        ensure_installed = { "delve" },
      })

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
      dap.listeners.after.event_exited["dapui_config"] = dapui.close

      require("dap-go").setup({
        delve = { detached = vim.fn.has("win32") == 0 },
      })

      local map = function(mode, key, func, desc)
        vim.keymap.set(mode, key, func, { desc = "DAP: " .. desc })
      end

      map("n", "<F5>", dap.continue, "Start/Continue")
      map("n", "<F1>", dap.step_into, "Step Into")
      map("n", "<F2>", dap.step_over, "Step Over")
      map("n", "<F3>", dap.step_out, "Step Out")
      map("n", "<leader>b", dap.toggle_breakpoint, "Toggle Breakpoint")
      map("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, "Set Breakpoint")
      map("n", "<F7>", dapui.toggle, "Toggle DAP UI")

      local ok, telescope = pcall(require, "telescope")
      if ok and telescope.extensions and telescope.extensions.dap then
        local telescope_dap = telescope.extensions.dap
        map("n", "<leader>Dc", telescope_dap.commands, "DAP Commands")
        map("n", "<leader>Dv", telescope_dap.variables, "DAP Variables")
        map("n", "<leader>Df", telescope_dap.frames, "DAP Frames")
      end
    end,
  },
}
