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
      { "<leader>th", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<leader>tj", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<leader>tk", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<leader>tl", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
}
