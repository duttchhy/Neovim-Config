return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    -- Keymaps under <leader>h
    local keys = {
      { "<leader>ha", function() harpoon:list():add() end, desc = "Add file" },
      { "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menu" },
      { "<leader>h1", function() harpoon:list():select(1) end, desc = "Go to file 1" },
      { "<leader>h2", function() harpoon:list():select(2) end, desc = "Go to file 2" },
      { "<leader>h3", function() harpoon:list():select(3) end, desc = "Go to file 3" },
      { "<leader>h4", function() harpoon:list():select(4) end, desc = "Go to file 4" },
    }

    for _, key in ipairs(keys) do
      vim.keymap.set("n", key[1], key[2], { desc = key.desc })
    end
  end,
}

