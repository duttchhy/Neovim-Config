-- colors.lua
-- Load Catppuccin Macchiato theme
return function()
  -- Check if Catppuccin is installed
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    vim.notify("Catppuccin theme not found!", vim.log.levels.WARN)
    return
  end

  catppuccin.setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = {
      light = "latte",
      dark = "macchiato",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      -- enable popular plugins
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      which_key = true,
      lsp_trouble = true,
      mason = true,
      noice = true,
      fidget = true,
    },
  })

  -- Apply the colorscheme
  vim.cmd.colorscheme("catppuccin")
-- Transparency
  transparent_background = true
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE
  hi StatusLine guibg=NONE
  hi LineNr guibg=NONE
  hi NonText guibg=NONE
]])

end

