return {
 "goolord/alpha-nvim",
 event = "VimEnter",
 dependencies = { "nvim-tree/nvim-web-devicons" },
config = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  -- Header
local function center_text(lines)
   local width = vim.o.columns
   local centered = {}
for _, line in ipairs(lines) do
    local pad = math.floor((width - #line) / 2)
    if pad < 0 then pad = 0 end
    table.insert(centered, string.rep(" ", pad) .. line)
    end
   return centered
   end
dashboard.section.header.val = {
   "                                            NeoVim, But the I am a rice farmer!",
   "      _____    ____   ____  _________________  _________________      _____    ____   ____  ____   ____  _____      _____ ",
   " ___|\\    \\  |    | |    |/                 \\/                 \\ ___|\\    \\  |    | |    ||    | |    ||\\    \\    /    /|",
   "|    |\\    \\ |    | |    |\\______     ______/\\______     ______//    /\\    \\ |    | |    ||    | |    || \\    \\  /    / |",
   "|    | |    ||    | |    |   \\( /    /  )/      \\( /    /  )/  |    |  |    ||    |_|    ||    |_|    ||  \\____\\/    /  /",
   "|    | |    ||    | |    |    ' |   |   '        ' |   |   '   |    |  |____||    .-.    ||    .-.    | \\ |    /    /  /",
   "|    | |    ||    | |    |      |   |              |   |       |    |   ____ |    | |    ||    | |    |  \\|___/    /  /",
   "|    | |    ||    | |    |     /   //             /   //       |    |  |    ||    | |    ||    | |    |      /    /  /",
   "|____|/____/||\\___\\_|____|    /___//             /___//        |\\ ___\\/    /||____| |____||____| |____|     /____/  /",
   "|    /    | || |    |    |   |`   |             |`   |         | |   /____/ ||    | |    ||    | |    |    |`    | /",
   "|____|____|/  \\|____|____|   |____|             |____|          \\|___|    | /|____| |____||____| |____|    |_____|/",
   "  \\(    )/       \\(   )/       \\(                 \\(              \\( |____|/   \\(     )/    \\(     )/         )/",
   "   '    '         '   '         '                  '               '   )/       '     '      '     '          '"
   }
  -- Buttons
dashboard.section.buttons.val = {
   dashboard.button("e", "📁  File Explorer", ":Ex<CR>"),
   dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
   dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
   dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
   dashboard.button("h", "📌 Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
   dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
   dashboard.button("l", "💤 Lazy", ":Lazy<CR>"),
   dashboard.button("c", "⚙️  Config", ":Ex ~/.config/nvim<CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
   }

  dashboard.section.footer.val = "🚀 Rocket Ship 8=======D 🚀"

  -- Layout
  alpha.setup(dashboard.config)
  end,
 }

