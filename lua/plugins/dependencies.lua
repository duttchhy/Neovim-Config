return {
  -- Snacks
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("snacks").setup()
    end,
  },

  -- Undotree
  {
    "mbbill/undotree",
    lazy = true,
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
    init = function()
      -- Configure Undotree to open on the right
      vim.g.undotree_WindowLayout = 2      -- 2 = right side, 1 = left
      vim.g.undotree_SplitWidth = 30       -- width of the Undotree window
      vim.g.undotree_SetFocusWhenToggle = 1 -- focus on Undotree when toggled
    end,
  },

  -- Comment Nvim
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },
  -- TodoTxt
  {
    "phrmendes/todotxt.nvim",
    cmd = { "TodoTxt", "DoneTxt" },
    opts = {
      todotxt = vim.env.HOME .. "/Documents/notes/todo.txt",
      donetxt = vim.env.HOME .. "/Documents/notes/done.txt",
      ghost_text = {
        enable = true,
        mappings = {
          ["(A)"] = "now",
          ["(B)"] = "next",
          ["(C)"] = "today",
        },
      },
    },
    config = function()
      vim.filetype.add({
        filename = {
          ["todo.txt"] = "todotxt",
          ["done.txt"] = "todotxt",
        },
      })
      require("todo").setup()
    end,
  },
}

