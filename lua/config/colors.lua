--__________                          
--\______   \____________    _____    
--|    |  _/\_  __ \__  \  /     \    
--|    |   \ |  | \// __ \|  Y Y  \   
--|______  / |__|  (____  /__|_|  /   
--\/             \/      \/           
return function()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    vim.notify("Catppuccin theme not found!", vim.log.levels.WARN)
    return
  end

  catppuccin.setup({
    flavour = "macchiato",
    background = { light = "latte", dark = "macchiato" },
    transparent_background = true,
    show_end_of_buffer = false,
    term_colors = true,
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
    },
    integrations = {
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

  vim.cmd.colorscheme("catppuccin")

  -- Apply transparent highlights safely
  local ok, _ = pcall(function()
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE
      hi StatusLine guibg=NONE
      hi LineNr guibg=NONE
      hi NonText guibg=NONE
    ]])
  end)
end
