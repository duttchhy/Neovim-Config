-- lua/plugins/neotree.lua
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",       -- optional, for icons
      "folke/snacks.nvim",                  -- optional, image previews
      "s1n7ax/nvim-window-picker",          -- optional, window picker
      "antosha417/nvim-lsp-file-operations" -- optional, LSP file operations
    },
    lazy = false,
    opts = {
      log_level = "info",                  -- fix healthcheck error
      window = {
        width = 35,
        mappings = {
          ["<space>"] = "toggle_node",
          ["<cr>"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["R"] = "refresh",
          ["?"] = "show_help",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ["<c-p>"] = "toggle_preview",  -- preview file
            ["<c-v>"] = "vsplit_preview",
          },
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
    },
    cmd = "Neotree",
    keys = {
      { "\\", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
    },
  },
}

