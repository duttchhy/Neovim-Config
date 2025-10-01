-- lua/plugins/neotree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = true, -- load on first toggle
  keys = {
    {
      "\\",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd("p") -- go back to last active window
        else
          vim.cmd.Neotree("toggle") -- toggle Neo-tree
        end
      end,
      desc = "Toggle NeoTree",
      silent = true,
    },
  },
  config = function()
    local has_git = vim.fn.isdirectory(".git") == 1
    local sources = {
      { source = "filesystem", display_name = "📂 Files" },
    }
    if has_git then
      table.insert(sources, { source = "git_status", display_name = " Git" })
    end
    table.insert(sources, { source = "buffers", display_name = "📄 Buffers" })

    local neotree = require("neo-tree")
    neotree.setup({
      enable_git_status = has_git,
      close_if_last_window = true,
      default_source = "filesystem",
      persistent = false,
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = sources,
      },
      sources = { "filesystem", has_git and "git_status" or nil, "buffers" },
      filesystem = {
        follow_current_file = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = has_git,
          never_show = { "node_modules", ".cache", "dist" },
        },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = vim.fn.has("win32") ~= 1,
      },
      window = {
        width = 30,
        mappings = {
          ["<S-CR>"] = "system_open",
          ["<Space>"] = false,
          ["[b"] = "prev_source",
          ["]b"] = "next_source",
          O = "system_open",
          Y = "copy_selector",
          h = "parent_or_close",
          l = "child_or_open",
        },
      },
    })

    -- Fix signcolumn/foldcolumn when entering Neo-tree
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "neo-tree" then
          vim.opt_local.signcolumn = "auto"
          vim.opt_local.foldcolumn = "0"
        end
      end,
    })

    -- Auto-open Neo-tree on startup if opening a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
        if stats and stats.type == "directory" then
          require("lazy").load { plugins = { "neo-tree.nvim" } }
          vim.cmd.Neotree("show")
        end
      end,
    })
  end,
}
