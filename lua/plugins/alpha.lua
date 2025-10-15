return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
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
            dashboard.button("e", "📁 File Explorer", ":Ex<CR>"),
            dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
            dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
            dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
            dashboard.button("l", "💤 Lazy", ":Lazy<CR>"),
            dashboard.button("c", "⚙️  Config", ":Ex ~/.config/nvim<CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }
        local lazy_stats = require("lazy").stats()
        dashboard.section.footer.val ={
            "🚀 Rocket Ship 8=========D 🚀",
            "🪫 Plugins loaded: " .. lazy_stats.loaded .. " / " .. lazy_stats.count .. " 🔋",
        }
        -- Keybinding
        vim.api.nvim_set_keymap('n', '<leader>A', ':Alpha<CR>', { noremap = true, silent = true})
        -- Layout
        alpha.setup(dashboard.config)
        -- Disable folding alpha buffer
        vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
}
