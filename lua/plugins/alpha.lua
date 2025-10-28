return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            "                                            NeoVim, But I am a rice farmer!",
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
        dashboard.section.buttons.val = {
            dashboard.button("e", "📁 File Explorer", ":Ex<CR>"),
            dashboard.button("f", "🔍 Find File", ":Telescope find_files<CR>"),
            dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
            dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "🔎 Find Text", ":Telescope live_grep<CR>"),
            dashboard.button("l", "💤 Extensions", ":Lazy<CR>"),
            dashboard.button("c", "⚙️ Config", ":Ex ~/.config/nvim<CR>"),
            dashboard.button("q", "🚫 Quit Neovim", ":qa<CR>"),
        }
        dashboard.section.footer.val = { "⏳ Loading plugins..." }
        alpha.setup(dashboard.config)
        -- Suppress empty buffer ERR
        vim.api.nvim_create_autocmd("WinResized", {
            callback = function()
                pcall(function()
                    require("alpha").redraw()
                end)
            end,
        })

        vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
        ]])
        vim.api.nvim_set_keymap('n', '<leader>A', ':Alpha<CR>', { noremap = true, silent = true })
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

                dashboard.section.footer.val = {
                    "🚀 Rocket Ship 8=========D 🚀",
                    "🪫 Plugins loaded: " .. stats.loaded .. " / " .. stats.count .. " 🔋",
                    "   ⏱ Loaded in " .. ms .. " ms ⏱"
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
