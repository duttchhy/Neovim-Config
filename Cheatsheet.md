# Neovim Config Cheatsheet

> **Structure:** `init.lua` → options & bootstrap | `lua/keymaps.lua` → all global keymaps | `plugin/` → auto-sourced plugin configs

---

## File Map

| File | Contains |
|------|----------|
| `init.lua` | Options, NetRW settings, filetype additions, Neovide font config, yank highlight autocmd |
| `lua/keymaps.lua` | All personal keymaps and global plugin keymaps |
| `plugin/catppuccin.lua` | Catppuccin Mocha colorscheme |
| `plugin/snacks.lua` | Snacks.nvim — picker, explorer, grep, zen mode, project search |
| `plugin/ui.lua` | which-key, mini.nvim, Alpha dashboard, Bufferline, Trouble, Aerial, Oil, Toggleterm |
| `plugin/lsp.lua` | nvim-lspconfig, Mason, mason-tool-installer, fidget, conform (formatter) |
| `plugin/completion.lua` | blink.cmp, LuaSnip, lazydev |
| `plugin/editor.lua` | autopairs, indent-blankline, nvim-lint, nvim-highlight-colors, auto-save, guess-indent, todo-comments, img-clip, undotree, suda, vim-visual-multi, Comment.nvim |
| `plugin/git.lua` | gitsigns |
| `plugin/syntax.lua` | treesitter-context |

---

## Keymaps by File

### `lua/keymaps.lua`

#### Personal
| Key | Mode | Action |
|-----|------|--------|
| `<leader>qq` | n | Quit current buffer (confirm) |
| `<leader>Q` | n | Quit all buffers (confirm) |
| `<leader>e` | n | Open Oil file explorer |
| `q` | n | Disabled (macro recording moved) |
| `<leader>W` | n | Record macro |

#### Visual Mode
| Key | Mode | Action |
|-----|------|--------|
| `J` | v | Move selection down |
| `K` | v | Move selection up |
| `<S-Down>` | v | Move selection down |
| `<S-Up>` | v | Move selection up |
| `p` | v | Paste without overwriting clipboard |
| `<` | v | Dedent and stay in visual mode |
| `>` | v | Indent and stay in visual mode |

#### Normal Mode
| Key | Mode | Action |
|-----|------|--------|
| `J` | n | Join lines (keep cursor position) |
| `<C-j>` | n | Scroll half-page down (centered) |
| `<C-k>` | n | Scroll half-page up (centered) |
| `n` | n | Next search result (centered) |
| `N` | n | Previous search result (centered) |
| `<A-Down>` | n | Next search result |
| `<A-Up>` | n | Previous search result |
| `=ap` | n | Re-indent paragraph |
| `<C-a>` | n | Select all text |
| `<C-m>` | n | Fix jumplist (acts as Ctrl+i) |
| `jj` | i | Exit insert mode |
| `S` | n | Search and replace in buffer |
| `<Esc>` | n | Clear search highlights |
| `<leader>nh` | n | Clear search highlights |

#### Registers / Clipboard
| Key | Mode | Action |
|-----|------|--------|
| `<C-c>` | n/v/x | Yank to system clipboard |
| `<leader>y` | n/v | Yank to system clipboard |
| `<C-x>` | n/v/x | Cut to system clipboard |
| `<leader>d` | n/v | Delete without affecting clipboard |
| `x` | n/v | Delete single char (no clipboard) |
| `<leader>c` | n/v | Change without yanking |
| `<leader>C` | n/v | Change to end without yanking |
| `<leader>D` | n/v | Delete to end without yanking |

#### Numeric
| Key | Mode | Action |
|-----|------|--------|
| `+` | n | Increment number under cursor |
| `-` | n | Decrement number under cursor |

#### Splits & Windows
| Key | Mode | Action |
|-----|------|--------|
| `ss` | n | Horizontal split |
| `sv` | n | Vertical split |
| `sh` | n | Move to left window |
| `sk` | n | Move to upper window |
| `sj` | n | Move to lower window |
| `sl` | n | Move to right window |
| `<C-h>` | n | Move focus to left window |
| `<C-l>` | n | Move focus to right window |
| `<C-Up>` | n | Resize window smaller (horizontal) |
| `<C-Down>` | n | Resize window larger (horizontal) |
| `<C-Left>` | n | Resize window smaller (vertical) |
| `<C-Right>` | n | Resize window larger (vertical) |

#### Buffers & Tabs
| Key | Mode | Action |
|-----|------|--------|
| `<S-q>` | n | Force close buffer |
| `<leader>bp` | n | Pick buffer (visual) |
| `<leader>bc` | n | Pick buffer to close (visual) |
| `<leader>bh` | n | Prev buffer |
| `<leader>bl` | n | Next buffer |
| `<leader>bH` | n | Move buffer left |
| `<leader>bL` | n | Move buffer right |
| `<leader>b1`–`b9` | n | Go to buffer 1–9 |
| `<leader>b0` | n | Go to last buffer |
| `<leader>bq` | n | Close buffer (save prompt) |
| `<leader>bs` | n | Split buffer horizontally |
| `<leader>bv` | n | Split buffer vertically |
| `<leader>t` | n | New tab |
| `<A-q>` | n | Close tab |

#### Diagnostics / Tools
| Key | Mode | Action |
|-----|------|--------|
| `<leader>q` | n | Open diagnostic quickfix list |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>a` | n | Open Alpha dashboard |
| `<leader>p` | n | Paste image from clipboard |
| `<F5>` | n | Toggle Undotree |
| `<leader>/` | n/x | Toggle comment |
| `<LeftMouse>` | n | Click URL to open in browser |

---

### `plugin/snacks.lua`

| Key | Action |
|-----|--------|
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sc` | Search commands |
| `<leader>sb` | Search Snacks builtins |
| `<leader>sf` | Search files |
| `<leader>ff` | Smart file search |
| `<leader>ss` | Search Snacks pickers |
| `<leader>sw` | Search word under cursor |
| `<leader>fg` | Grep search |
| `<leader>fp` | Search projects |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Search recent files |
| `<leader>fe` | Open Snacks file explorer (tree) |
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search current buffer |
| `<leader>s/` | Search in open buffers |
| `<leader>sn` | Search Neovim config files |
| `<C-\>` | Toggle Zen mode |

---

### `plugin/lsp.lua`

> These are buffer-local — only active when an LSP is attached to the file.

| Key | Action |
|-----|--------|
| `grn` | Rename symbol |
| `gra` | Code action |
| `grr` | Go to references |
| `gri` | Go to implementation |
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `grt` | Go to type definition |
| `<leader>=` | Format buffer (conform / LSP fallback) |

---

### `plugin/git.lua` (Gitsigns)

| Key | Action |
|-----|--------|
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hR` | Reset entire buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line (full) |
| `<leader>hd` | Diff this |
| `<leader>gb` | Toggle inline git blame |
| `<leader>gw` | Toggle word diff |

---

### `plugin/ui.lua`

#### Bufferline
| Key | Action |
|-----|--------|
| `<S-l>` | Next buffer |
| `<S-h>` | Prev buffer |

#### Trouble
| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics panel (all files) |
| `<leader>xX` | Toggle diagnostics panel (current buffer) |
| `<leader>cs` | Toggle symbols panel |

#### Aerial
| Key | Action |
|-----|--------|
| `<leader>v` | Toggle symbol outline sidebar |

#### Oil
| Key | Action |
|-----|--------|
| `<leader>e` | Open Oil in current window |
| `<leader>o` | Open Oil as floating window |
| `-` | Open parent directory |
| *(inside Oil)* `<CR>` | Open file / enter directory |
| *(inside Oil)* `-` | Go up to parent directory |
| *(inside Oil)* `<C-s>` | Open in vertical split |
| *(inside Oil)* `<C-h>` | Open in horizontal split |
| *(inside Oil)* `<M-h>` | Open in horizontal split (your override) |
| *(inside Oil)* `<C-t>` | Open in new tab |
| *(inside Oil)* `<C-p>` | Preview file |
| *(inside Oil)* `<C-c>` | Close Oil |
| *(inside Oil)* `q` | Close Oil |
| *(inside Oil)* `<Esc>` | Close Oil |
| *(inside Oil)* `gs` | Change sort order |
| *(inside Oil)* `` ` `` | cd to directory |
| *(inside Oil)* `g~` | tcd to directory (tab-scoped) |
| *(inside Oil)* `g.` | Toggle hidden files |
| *(inside Oil)* `gx` | Open with system app |
| *(inside Oil)* `g?` | Show all Oil keybinds |

#### Toggleterm
| Key | Action |
|-----|--------|
| `<C-\`>` | Toggle terminal (opens in buffer's directory) |

---

## ⚠️ Known Issues / Pending Fixes

| Issue | File | Status |
|-------|------|--------|
| `<leader>b1`–`b9` BufferLine binds not applied | `lua/keymaps.lua` | Live file still has old `1gt` binds — replace with latest `keymaps.lua` from outputs |
| Grammarly + Ionide still in `editor.lua` | `plugin/editor.lua` | Live file not updated — replace with latest from outputs |
| img-clip path hardcoded to `/home/titus/` | `plugin/editor.lua` | Update `dir_path` to your own path |
