return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    cmd = { "Neotree", "NeoTreeFocus" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    keys = {
      { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
    },
    opts = {
      source_selector = {
        winbar = true,
        statusline = true,
        show_scrolled_off_parent_node = false,
        sources = {
          {
            source = "filesystem",
            display_name = " 󰉓 Files ",
          },
          {
            source = "git_status",
            display_name = " 󰊢 Git ",
          },
        },
        content_layout = "start",
        tabs_layout = "equal",
        truncation_character = "…",
        tabs_min_width = nil,
        tabs_max_width = nil,
        padding = 0,
        separator = { left = "▏", right = "▕" },
        separator_active = nil,
        show_separator_on_edge = false,
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
      },
      filesystem = {
        hijack_netrw_behavior = "disabled",
        hide_hidden = false,
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
        components = {
          harpoon_index = function(config, node, _)
            local harpoon_list = require("harpoon"):list()
            local path = node:get_id()
            local harpoon_key = vim.uv.cwd()

            for i, item in ipairs(harpoon_list.items) do
              local value = item.value
              if string.sub(item.value, 1, 1) ~= "/" then
                value = harpoon_key .. "/" .. item.value
              end

              if value == path then
                vim.print(path)
                return {
                  text = string.format(" ⥤ %d", i),
                  highlight = config.highlight or "NeoTreeDirectoryIcon",
                }
              end
            end
            return {}
          end,
        },
        renderers = {
          file = {
            { "icon" },
            { "name", use_git_status_colors = true },
            { "harpoon_index" },
            { "diagnostics" },
            { "git_status", highlight = "NeoTreeDimText" },
          },
        },
      },
    },
  },
}
