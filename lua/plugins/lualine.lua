local catppuccin = require("catppuccin.palettes").get_palette("mocha")
-- pick some key colors
local colors = {
  purple = catppuccin.mauve, -- left 'NORMAL' mode
  red = catppuccin.red, -- right 'location'
  grey = catppuccin.surface0,
  white = catppuccin.text,
  black = catppuccin.base,
  blue = catppuccin.blue,
  cyan = catppuccin.teal,
}
local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.purple },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        -- LEFT bubble
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", "branch" },
        -- CENTER separator
        lualine_c = {
          { "", separator = { left = "", right = "" }, padding = 0 },
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        -- RIGHT bubble
        lualine_z = {
          {
            "location",
            separator = { right = "" },
            left_padding = 2,
            color = { fg = colors.black, bg = colors.red },
          },
          {
            function()
              return " " .. os.date("%H:%M")
            end,
            separator = { left = "", right = "" }, -- added right separator
            color = { fg = colors.black, bg = colors.red },
            right_padding = 2,
          },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    },
  },
}
