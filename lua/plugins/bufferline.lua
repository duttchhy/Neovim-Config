return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    keys = function()
      local keys = {
        { "<leader>bp", "<Cmd>BufferLinePick<CR>", desc = "Pick Bufferline" },
        { "<leader>bc", "<Cmd>BufferLinePickClose<CR>", desc = "Pick Bufferline to close" },
        { "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<leader>bl", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "<leader>bH", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
        { "<leader>bL", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      }

      -- Add leader+b1..b9 and b0 mappings
      for i = 1, 9 do
        table.insert(keys, {
          "<leader>b" .. i,
          "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
          desc = "Go to buffer " .. i,
        })
      end
      table.insert(keys, {
        "<leader>b0",
        "<Cmd>BufferLineGoToBuffer 0<CR>",
        desc = "Go to last buffer",
      })

      -- Close current buffer (prompt to save)
      table.insert(keys, {
        "<leader>bq",
        function()
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
        end,
        desc = "Close current buffer (prompt to save if modified)",
      })

      -- Split current buffer horizontally
      table.insert(keys, {
        "<leader>bs",
        function()
          vim.cmd("split")
        end,
        desc = "Split buffer horizontally",
      })

      -- Split current buffer vertically
      table.insert(keys, {
        "<leader>bv",
        function()
          vim.cmd("vsplit")
        end,
        desc = "Split buffer vertically",
      })

      return keys
    end,

    opts = {
      options = {
        close_command = function(n)
          vim.api.nvim_buf_delete(n, { force = true })
        end,
        right_mouse_command = function(n)
          vim.api.nvim_buf_delete(n, { force = true })
        end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local error_icon = ""
          local warn_icon = ""
          local ret = (diag.error and error_icon .. diag.error .. " " or "")
            .. (diag.warning and warn_icon .. diag.warning or "")
          return vim.trim(ret)
        end,
        -- FIX: was "NvimTree" — the active file explorer is Neo-tree (filetype = "neo-tree").
        -- The old value never matched, so the bufferline overlapped the sidebar.
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            separator = true,
            text_align = "center",
          },
        },
        get_element_icon = function(opts)
          local icon, _ = require("nvim-web-devicons").get_icon(opts.name, opts.extension)
          return icon or ""
        end,
        hover = { enabled = false },
        separator_style = "thin",
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        color_icons = true,
        enforce_regular_tabs = true,
      },
    },

    config = function(_, opts)
      require("bufferline").setup(opts)

      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function()
            pcall(require("bufferline").update)
          end)
        end,
      })
    end,
  },
}
