return {
{ "nvim-tree/nvim-web-devicons", opts = {} },
{
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,  -- load on startup
  priority = 1000, -- make sure it loads before other plugins that depend on colors
opts = {
   flavour = "mocha", -- latte, frappe, macchiato, mocha
background = {
    light = "latte",
    dark = "mocha",
    },
   transparent_background = false,
   show_end_of_buffer = true, -- show '~' at end of buffer
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
    treesitter = true,
native_lsp = {
     enabled = true,
virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = { "italic" },
      information = { "italic" },
      },
underlines = {
      errors = { "underline" },
      hints = { "underline" },
      warnings = { "underline" },
      information = { "underline" },
      },
     },
    lsp_trouble = true,
    gitgutter = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    which_key = true,
    indent_blankline = { enabled = true, colored_indent_levels = false },
    dashboard = true,
    neogit = true,
    vim_sneak = false,
    fern = false,
    barbar = true,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    hop = true,
    },
   },
config = function(_, opts)
   require("catppuccin").setup(opts)
   vim.cmd.colorscheme("catppuccin")
   end,
  },
 }

