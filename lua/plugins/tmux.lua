return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<leader>th", "<cmd>TmuxNavigateLeft<cr>", mode = "n", desc = "Navigate Left" },
      { "<leader>tj", "<cmd>TmuxNavigateDown<cr>", mode = "n", desc = "Navigate Down" },
      { "<leader>tk", "<cmd>TmuxNavigateUp<cr>", mode = "n", desc = "Navigate Up" },
      { "<leader>tl", "<cmd>TmuxNavigateRight<cr>", mode = "n", desc = "Navigate Right" },
    },
  },
}
