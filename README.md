# My Rice for Neovim

```md
      :::::::::  :::    ::: ::::::::::: ::::::::::: ::::::::  :::    ::: :::    ::: :::   :::
     :+:    :+: :+:    :+:     :+:         :+:    :+:    :+: :+:    :+: :+:    :+: :+:   :+:
    +:+    +:+ +:+    +:+     +:+         +:+    +:+        +:+    +:+ +:+    +:+  +:+ +:+
   +#+    +:+ +#+    +:+     +#+         +#+    +#+        +#++:++#++ +#++:++#++   +#++:
  +#+    +#+ +#+    +#+     +#+         +#+    +#+        +#+    +#+ +#+    +#+    +#+
 #+#    #+# #+#    #+#     #+#         #+#    #+#    #+# #+#    #+# #+#    #+#    #+#
#########   ########      ###         ###     ########  ###    ### ###    ###    ###
```

---
> No, I will not explain myself
---

## Requirements

- **Neovim 0.12+** (uses native `vim.pack` package manager — no lazy.nvim)
- A **Nerd Font** (Ubuntu Nerd Font used in install script below)
- `ripgrep` — for live grep search
- `git`
- `make` — for LuaSnip jsregexp build
- `cwebp` — optional, for img-clip image paste (webp conversion)

---

## Structure

```
~/.config/nvim/
├── init.lua                  # Options, globals, bootstrap
├── lua/
│   └── keymaps.lua           # All personal keymaps
└── plugin/                   # Auto-sourced plugin configs
    ├── catppuccin.lua         # Colorscheme
    ├── snacks.lua             # Picker, explorer, zen, grep
    ├── ui.lua                 # Dashboard, bufferline, statusline, oil, toggleterm, trouble, aerial
    ├── lsp.lua                # LSP, Mason, conform (formatter), fidget
    ├── completion.lua         # blink.cmp, LuaSnip, lazydev
    ├── editor.lua             # Autopairs, lint, highlights, autosave, todo-comments, undotree, etc.
    ├── git.lua                # Gitsigns
    ├── syntax.lua             # Treesitter-context
    ├── markdown.lua           # Markview, VimTeX
    └── opencode.lua           # opencode.nvim AI assistant
```

---

## Plugins

### Aesthetic & UI
| Plugin | Purpose | Config |
|--------|---------|--------|
| [catppuccin](https://github.com/catppuccin/nvim) | Catppuccin Mocha colorscheme | `plugin/catppuccin.lua` |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Dashboard with recent files | `plugin/ui.lua` |
| [mini.statusline](https://github.com/echasnovski/mini.nvim) | Statusline with rounded separators | `plugin/ui.lua` |
| [mini.icons](https://github.com/echasnovski/mini.nvim) | Icon support | `plugin/ui.lua` |
| [mini.ai](https://github.com/echasnovski/mini.nvim) | Extended text objects | `plugin/ui.lua` |
| [mini.surround](https://github.com/echasnovski/mini.nvim) | Surround motions | `plugin/ui.lua` |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | VSCode-style buffer tabs | `plugin/ui.lua` |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybind hint popup | `plugin/ui.lua` |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides | `plugin/editor.lua` |
| [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Inline colour previews | `plugin/editor.lua` |

### Navigation & Files
| Plugin | Purpose | Config |
|--------|---------|--------|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Picker, file explorer, grep, zen mode | `plugin/snacks.lua` |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit filesystem like a buffer | `plugin/ui.lua` |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Symbol outline sidebar | `plugin/ui.lua` |
| [undotree](https://github.com/mbbill/undotree) | Undo history tree (`<F5>`) | `plugin/editor.lua` |

### LSP & Completion
| Plugin | Purpose | Config |
|--------|---------|--------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configurations | `plugin/lsp.lua` |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/formatter/linter installer | `plugin/lsp.lua` |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter (`<leader>=`) | `plugin/lsp.lua` |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress notifications | `plugin/lsp.lua` |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Fast completion engine | `plugin/completion.lua` |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine | `plugin/completion.lua` |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Neovim Lua API completions | `plugin/completion.lua` |

### Editor Utilities
| Plugin | Purpose | Config |
|--------|---------|--------|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes | `plugin/editor.lua` |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Async linting | `plugin/editor.lua` |
| [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim) | Auto-save on idle | `plugin/editor.lua` |
| [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim) | Auto-detect indentation | `plugin/editor.lua` |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO/FIXME/etc | `plugin/editor.lua` |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart commenting (`<leader>/`) | `plugin/editor.lua` |
| [img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim) | Paste images into markdown (`<leader>p`) | `plugin/editor.lua` |
| [suda.vim](https://github.com/lambdalisue/suda.vim) | Edit files with sudo (`:SudaWrite`) | `plugin/editor.lua` |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Multi-cursor (`<C-n>`) | `plugin/editor.lua` |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics panel (`<leader>xx`) | `plugin/ui.lua` |

### Git
| Plugin | Purpose | Config |
|--------|---------|--------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs, hunk actions, blame | `plugin/git.lua` |

### Syntax
| Plugin | Purpose | Config |
|--------|---------|--------|
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Sticky function/class context | `plugin/syntax.lua` |

### Language Specific
| Plugin | Purpose | Config |
|--------|---------|--------|
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Rich markdown preview (`<C-s>M`) | `plugin/markdown.lua` |
| [vimtex](https://github.com/lervag/vimtex) | LaTeX editing (Zathura viewer) | `plugin/markdown.lua` |

### AI
| Plugin | Purpose | Config |
|--------|---------|--------|
| [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) | opencode AI assistant integration | `plugin/opencode.lua` |

### Terminal
| Plugin | Purpose | Config |
|--------|---------|--------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Toggle terminal (`<C-\`>`) | `plugin/ui.lua` |

---

## Key Bindings (Highlights)

> Full keybind reference is in `Cheatsheet.md`

| Key | Action |
|-----|--------|
| `<leader>e` | Open file explorer (Oil) |
| `<leader>o` | Open Oil as floating window |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>sw` | Search word under cursor |
| `<leader>=` | Format buffer |
| `<leader>xx` | Toggle diagnostics panel |
| `<leader>b1`–`b9` | Go to buffer 1–9 |
| `<leader>bq` | Close buffer (save prompt) |
| `<C-j>` / `<C-k>` | Scroll half page down/up |
| `<C-\`>` | Toggle terminal |
| `<F5>` | Toggle undotree |
| `<leader>/` | Toggle comment |
| `go` / `goo` | Add range/line to opencode |
| `<leader>at` | Toggle opencode |

---

## Install
### Debian 11-12
```sh
curl -fsSL https://git.duttchhy.com/bram/nvim/raw/branch/nightly/legacyinstall.sh
```
### Anything Newer
```sh
Use your package manager
```

