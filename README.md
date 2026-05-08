# My Rice for Neovim
```
      _____    ____   ____  _________________  _________________      _____    ____   ____  ____   ____  _____      _____ 
  ___|\    \  |    | |    |/                 \/                 \ ___|\    \  |    | |    ||    | |    ||\    \    /    /|
 |    |\    \ |    | |    |\______     ______/\______     ______//    /\    \ |    | |    ||    | |    || \    \  /    / |
 |    | |    ||    | |    |   \( /    /  )/      \( /    /  )/  |    |  |    ||    |_|    ||    |_|    ||  \____\/    /  /
 |    | |    ||    | |    |    ' |   |   '        ' |   |   '   |    |  |____||    .-.    ||    .-.    | \ |    /    /  / 
 |    | |    ||    | |    |      |   |              |   |       |    |   ____ |    | |    ||    | |    |  \|___/    /  /  
 |    | |    ||    | |    |     /   //             /   //       |    |  |    ||    | |    ||    | |    |      /    /  /   
 |____|/____/||\___\_|____|    /___//             /___//        |\ ___\/    /||____| |____||____| |____|     /____/  /    
 |    /    | || |    |    |   |`   |             |`   |         | |   /____/ ||    | |    ||    | |    |    |`    | /     
 |____|____|/  \|____|____|   |____|             |____|          \|___|    | /|____| |____||____| |____|    |_____|/      
   \(    )/       \(   )/       \(                 \(              \( |____|/   \(     )/    \(     )/         )/         
    '    '         '   '         '                  '               '   )/       '     '      '     '          '          
```
---
> No, I will not explain myself
```sh
curl -fsSL https://git.duttchhy.com/bram/nvim/src/branch/nightly/legacyinstall.sh | bash
```

[Gitea](https://git.duttchhy.com)
## Dashboard & Aesthetic
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** – Fast, customizable start screen/dashboard.  
- **[catppuccin](https://github.com/catppuccin/nvim)** – Beautiful pastel theme with multiple flavors.  
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** – Fast and configurable status line.  
- **[mini.icons](https://github.com/echasnovski/mini.nvim)** – Minimal icon support for UI components.  

## Git & Version Control
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** – Shows Git changes in the sign column.  

## File Explorer & Navigation
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** – File explorer tree with LSP and icon support.  
- **[nui.nvim](https://github.com/MunifTanjim/nui.nvim)** – UI component library required by Neo-tree.  
- **[nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)** – File operations integrated with Neo-tree.  
- **[nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker)** – Pick windows when performing operations.  
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** – Lua utilities used by Neo-tree and other plugins.  
- **[undotree](https://github.com/mbbill/undotree)** – Undo history visualizer (`<leader>u` to toggle).  

## LSP & Development
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** – Package manager for LSPs, DAPs, linters, and formatters.  
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** – Bridges Mason with nvim-lspconfig.  
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** – Quickstart configurations for LSP servers.  

## Syntax & Text Objects
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** – Incremental parsing and syntax highlighting.  
- **[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)** – Extra text objects for Treesitter.  
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** – Auto-close and rename HTML/JSX tags.  
- **[nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)** – Context-aware comment strings.  
- **[playground](https://github.com/nvim-treesitter/playground)** – Treesitter playground for exploring syntax trees.  

## Fuzzy Finding & Utilities
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** – Highly extendable fuzzy finder.  
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** – Miscellaneous utilities: image previews, dashboards, pickers, etc.  
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** – Displays available keybindings in a popup.  

## Icons
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** – File type icons for statuslines, trees, and more.  
---
## Dependencies
 - ripgrep
 - Luarocks
 - cmake
 - git
 - python3
 - cargo
 - javac

### Steps to Install from source:
```sh
#Download prereqs
sudo apt update -y && sudo apt upgrade -y
sudo apt install curl ripgrep fd-find wget fontconfig git unzip cmake cargo luarocks python3 tar -y

# Directory setup
mkdir -p ~/.config && cd ~/.config
cargo install --locked tree-sitter-cli

# remove old /opt/nvim, extract new version, and symlink again
rm -rf /opt/nvim
# download new AppImage
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
# add execute permissions
sudo chmod u+x nvim-linux-x86_64.appimage
# Use App image extract if outdate FUSE
./nvim-linux-x86_64.appimage --appimage-extract
# Install it
mv squashfs-root /opt/nvim
# Symlink
ln -sf /opt/nvim/AppRun /usr/local/bin/nvim
git clone https://git.duttchhy.com/bram/nvim.git && cd nvim

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Nerd font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Ubuntu.zip
mkdir -p ~/.local/share/fonts
unzip Ubuntu.zip -d ~/.local/share/fonts/Ubuntu
fc-cache -fv
rm Ubuntu.zip

# Clean up
sudo apt autoremove -y && sudo apt autoclean -y
```
---


