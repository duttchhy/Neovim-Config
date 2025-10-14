return {
  {
    "prichrd/netrw.nvim",
    lazy = false,  -- load immediately
    opts = {
      icons = {
        symlink = '',
        directory = '',
        file = '',
      },
      use_devicons = true,
      mappings = {
        ['p'] = function(payload) print(vim.inspect(payload)) end,
        ['<Leader>p'] = ":echo 'hello world'<CR>",
      },
    },
  },
}
