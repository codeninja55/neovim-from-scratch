# Keymaps reference

This document covers all active keymaps in this Neovim / NvChad v2.5 configuration, including plugin-specific bindings. Sources: the NvChad default `mappings.lua`, `lua/mappings.lua`, `lua/user/keymaps.lua`, `lua/user/whichkey.lua`, and upstream plugin documentation.

## Conventions

| Notation | Meaning |
|---|---|
| `<leader>` | `Space` |
| `<C-x>` | Ctrl + x |
| `<A-x>` | Alt + x |
| `<S-x>` | Shift + x |
| `[n]` | Normal mode |
| `[i]` | Insert mode |
| `[v]` | Visual mode |
| `[x]` | Visual block mode |
| `[t]` | Terminal mode |

---

## Core Neovim motions

These are built into Neovim itself — no plugin required.

### Movement

| Key | Action |
|---|---|
| `h` `j` `k` `l` | Left / down / up / right |
| `w` `b` | Next / previous word start |
| `e` | Next word end |
| `0` `^` `$` | Start of line / first non-blank / end of line |
| `gg` `G` | Top / bottom of file |
| `{` `}` | Previous / next empty line (paragraph) |
| `%` | Jump to matching bracket |
| `<C-d>` `<C-u>` | Scroll half-page down / up |
| `<C-f>` `<C-b>` | Scroll full page down / up |
| `*` `#` | Search word under cursor forward / backward |
| `n` `N` | Next / previous search match |
| `f{c}` `F{c}` | Jump to character `c` on line (forward / backward) |
| `t{c}` `T{c}` | Jump before character `c` on line (forward / backward) |
| `;` `,` | Repeat last `f`/`t` forward / backward |
| `<C-o>` `<C-i>` | Jump list backward / forward |

### Editing

| Key | Action |
|---|---|
| `i` `a` | Insert before / after cursor |
| `I` `A` | Insert at line start / end |
| `o` `O` | New line below / above and insert |
| `x` `X` | Delete character under / before cursor |
| `d{motion}` | Delete (e.g. `dw`, `d$`, `dd`) |
| `c{motion}` | Change (delete + enter insert) |
| `y{motion}` | Yank (copy) |
| `p` `P` | Paste after / before cursor |
| `u` `<C-r>` | Undo / redo |
| `.` | Repeat last change |
| `~` | Toggle case of character |
| `>>` `<<` | Indent / dedent line |
| `=` | Auto-indent (motion or selection) |
| `J` | Join line below to current |

### Operators + text objects

| Key | Action |
|---|---|
| `ciw` `diw` `yiw` | Change / delete / yank inner word |
| `ci"` `di"` | Change / delete inside quotes |
| `ci(` `ca(` | Change inside / around parentheses |
| `ci{` `ca{` | Change inside / around braces |
| `cit` `cat` | Change inside / around HTML tag |
| `vas` `vap` | Select around sentence / paragraph |

### Folds

| Key | Action |
|---|---|
| `za` | Toggle fold under cursor |
| `zc` `zo` | Close / open fold |
| `zM` `zR` | Close all / open all folds |

### Marks

| Key | Action |
|---|---|
| `m{a-z}` | Set local mark |
| `` `{a-z} `` | Jump to mark (exact position) |
| `'{a-z}` | Jump to mark (line start) |

### Registers

| Key | Action |
|---|---|
| `"{r}y` | Yank into register `r` |
| `"{r}p` | Paste from register `r` |
| `""` | Default register |
| `"+` `"*` | System clipboard / primary selection |
| `"0` | Last yank register |
| `":` | Last command register |

---

## NvChad defaults

Source: `~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua` (v2.5, confirmed from source).

### General [n]

| Key | Action |
|---|---|
| `<C-s>` | Save file |
| `<C-c>` | Copy entire file to system clipboard |
| `<Esc>` | Clear search highlights |
| `<leader>n` | Toggle line numbers |
| `<leader>rn` | Toggle relative line numbers |
| `<leader>ch` | Open NvCheatsheet |
| `<leader>fm` | Format file (conform.nvim) |
| `<leader>ds` | LSP diagnostics → location list |
| `;` | Enter command mode (equivalent to `:`) |

### General [n, x]

| Key | Action |
|---|---|
| `<leader>fm` | Format file or selection (conform.nvim) |

### Buffer / tabufline [n]

| Key | Action |
|---|---|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>b` | New empty buffer |
| `<leader>x` | Close current buffer |
| `<A-w>` | Close current buffer |

### Window navigation [n]

| Key | Action |
|---|---|
| `<C-h>` | Focus window left |
| `<C-j>` | Focus window below |
| `<C-k>` | Focus window above |
| `<C-l>` | Focus window right |

### Comments [n, v]

| Key | Action |
|---|---|
| `<leader>/` | Toggle comment on line [n] or selection [v] |

### Terminal [t]

| Key | Action |
|---|---|
| `<C-x>` | Exit terminal mode (return to normal) |

### Terminal — toggle [n, t]

| Key | Action |
|---|---|
| `<A-h>` | Toggle horizontal terminal |
| `<A-v>` | Toggle vertical terminal |
| `<A-i>` | Toggle floating terminal |

### Terminal — new [n]

| Key | Action |
|---|---|
| `<leader>h` | New horizontal terminal |
| `<leader>v` | New vertical terminal |

### Insert mode movement [i]

| Key | Action |
|---|---|
| `<C-b>` | Move to beginning of line |
| `<C-e>` | Move to end of line |
| `<C-h>` | Move left one character |
| `<C-l>` | Move right one character |
| `<C-j>` | Move down one line |
| `<C-k>` | Move up one line |

---

## User custom keymaps

Source: `lua/mappings.lua` and `lua/user/keymaps.lua`.

### Insert mode [i]

| Key | Action |
|---|---|
| `jk` | Exit insert mode |
| `kj` | Exit insert mode |

### Normal mode [n]

| Key | Action |
|---|---|
| `;` | Enter command mode (`:`) |
| `<C-h>` | Focus window left |
| `<C-j>` | Focus window below |
| `<C-k>` | Focus window above |
| `<C-l>` | Focus window right |
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<A-j>` | Move current line down |
| `<A-k>` | Move current line up |
| `<leader><Up>` | Decrease window height |
| `<leader><Down>` | Increase window height |
| `<leader><Left>` | Decrease window width |
| `<leader><Right>` | Increase window width |

### Visual mode [v]

| Key | Action |
|---|---|
| `<` | Dedent selection (stays selected) |
| `>` | Indent selection (stays selected) |
| `<A-j>` | Move selection down |
| `<A-k>` | Move selection up |
| `p` | Paste without overwriting yank register |

### Visual block mode [x]

| Key | Action |
|---|---|
| `J` | Move block down |
| `K` | Move block up |
| `<A-j>` | Move block down |
| `<A-k>` | Move block up |

---

## Leader key groups (which-key)

Source: `lua/user/whichkey.lua`. Press `<leader>` and pause — which-key will surface these as a popup.

> **Note:** Some entries in this file reference plugins from the previous packer-based config (Alpha, ToggleTerm, lazygit). Mappings that call `_LAZYGIT_TOGGLE()`, `_NODE_TOGGLE()`, etc. require those terminal integrations to be configured. The NvChad-native equivalents for navigation and file search are listed in the NvChad defaults section above.

### Single-key leader shortcuts [n]

| Key | Action |
|---|---|
| `<leader>a` | Open Alpha dashboard |
| `<leader>b` | Telescope: buffers (dropdown, no preview) |
| `<leader>e` | Toggle nvim-tree explorer |
| `<leader>w` | Save file (force) |
| `<leader>q` | Quit (force) |
| `<leader>c` | Close buffer (force) |
| `<leader>h` | Clear search highlight |
| `<leader>f` | Telescope: find files (dropdown, no preview) |
| `<leader>F` | Telescope: live grep (ivy theme) |
| `<leader>P` | Telescope: projects |

### `<leader>p` — Lazy plugin manager

| Key | Action |
|---|---|
| `<leader>pi` | Lazy install |
| `<leader>ps` | Lazy sync |
| `<leader>pS` | Lazy status UI |
| `<leader>pu` | Lazy update |
| `<leader>pc` | Lazy clean |
| `<leader>pl` | Lazy log |

### `<leader>g` — Git

| Key | Action |
|---|---|
| `<leader>gg` | Open lazygit (floating window) |
| `<leader>gf` | Open lazygit for current file |
| `<leader>gc` | Open lazygit commits for current file |
| `<leader>gj` | Gitsigns: next hunk |
| `<leader>gk` | Gitsigns: previous hunk |
| `<leader>gl` | Gitsigns: blame line |
| `<leader>gp` | Gitsigns: preview hunk |
| `<leader>gr` | Gitsigns: reset hunk |
| `<leader>gR` | Gitsigns: reset buffer |
| `<leader>gs` | Gitsigns: stage hunk |
| `<leader>gu` | Gitsigns: undo stage hunk |
| `<leader>go` | Telescope: git status (open changed file) |
| `<leader>gb` | Telescope: git branches |
| `<leader>gc` | Telescope: git commits |
| `<leader>gd` | Gitsigns: diff against HEAD |

### `<leader>l` — LSP

| Key | Action |
|---|---|
| `<leader>la` | Code action |
| `<leader>ld` | Telescope: document diagnostics |
| `<leader>lw` | Telescope: workspace diagnostics |
| `<leader>lf` | Format buffer (async) |
| `<leader>li` | LSP info |
| `<leader>lj` | Next diagnostic |
| `<leader>lk` | Previous diagnostic |
| `<leader>ll` | CodeLens action |
| `<leader>lq` | Diagnostics → quickfix |
| `<leader>lr` | Rename symbol |
| `<leader>ls` | Telescope: document symbols |
| `<leader>lS` | Telescope: workspace symbols |

### `<leader>s` — Search

| Key | Action |
|---|---|
| `<leader>sb` | Telescope: git branches |
| `<leader>sc` | Telescope: colorschemes |
| `<leader>sh` | Telescope: help tags |
| `<leader>sM` | Telescope: man pages |
| `<leader>sr` | Telescope: recent files |
| `<leader>sR` | Telescope: registers |
| `<leader>sk` | Telescope: keymaps |
| `<leader>sC` | Telescope: commands |

### `<leader>t` — Terminal (ToggleTerm)

| Key | Action |
|---|---|
| `<leader>tn` | Open Node terminal |
| `<leader>tu` | Open NCDU terminal |
| `<leader>tt` | Open Htop terminal |
| `<leader>tp` | Open Python terminal |
| `<leader>tf` | ToggleTerm: floating |
| `<leader>th` | ToggleTerm: horizontal (10 lines) |
| `<leader>tv` | ToggleTerm: vertical (80 cols) |

### `<leader>w` — WhichKey

| Key | Action |
|---|---|
| `<leader>wK` | WhichKey: show all keymaps |
| `<leader>wk` | WhichKey: query a specific keymap |

---

## Telescope — inside picker

These bindings are active only when a Telescope picker is open.

### Insert mode [i] (typing in the search prompt)

| Key | Action |
|---|---|
| `<C-n>` / `<Down>` | Move selection down |
| `<C-p>` / `<Up>` | Move selection up |
| `<CR>` | Open selected item |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<Tab>` | Toggle selection + move down |
| `<S-Tab>` | Toggle selection + move up |
| `<C-q>` | Send all results to quickfix |
| `<M-q>` | Send selected results to quickfix |
| `<C-u>` | Scroll preview up |
| `<C-d>` | Scroll preview down |
| `<C-w>` | Delete word backward in prompt |
| `<C-r><C-w>` | Insert word under cursor into prompt |
| `<C-c>` | Close picker |
| `<C-/>` | Show which-key help for picker |

### Normal mode [n] (press `<Esc>` or `<C-[>` to enter)

| Key | Action |
|---|---|
| `j` / `<Down>` | Move selection down |
| `k` / `<Up>` | Move selection up |
| `H` `M` `L` | Jump to top / middle / bottom of list |
| `gg` `G` | Jump to first / last result |
| `<CR>` | Open selected item |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<Tab>` | Toggle selection + move down |
| `<S-Tab>` | Toggle selection + move up |
| `<C-q>` | Send all results to quickfix |
| `<M-q>` | Send selected results to quickfix |
| `<C-u>` | Scroll preview up |
| `<C-d>` | Scroll preview down |
| `<Esc>` | Close picker |
| `?` | Show which-key help for picker |

---

## nvim-tree

Bindings are active only inside the nvim-tree buffer. Open with `<C-n>` or `<leader>e`.

### Navigation

| Key | Action |
|---|---|
| `<CR>` / `o` | Open file or expand directory |
| `<Tab>` | Preview file (no focus change) |
| `<BS>` | Collapse parent directory |
| `-` | Go up to parent directory |
| `P` | Jump to parent node |
| `>` / `<` | Next / previous sibling |
| `J` / `K` | Last / first sibling |
| `<C-]>` | CD into directory |
| `[c` / `]c` | Previous / next git change |
| `[e` / `]e` | Previous / next diagnostic |

### Opening

| Key | Action |
|---|---|
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `O` | Open without window picker |

### File operations

| Key | Action |
|---|---|
| `a` | Create file (`/` suffix creates directory) |
| `d` | Delete |
| `D` | Trash |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |

### View and filters

| Key | Action |
|---|---|
| `H` | Toggle dotfiles |
| `I` | Toggle git-ignored files |
| `R` | Refresh tree |
| `E` | Expand all |
| `W` | Collapse all |
| `f` | Start live filter |
| `F` | Clear live filter |
| `S` | Search for node |
| `q` | Close tree |
| `g?` | Toggle help |
| `<C-k>` | Show file info |

---

## LSP

NvChad configures these LSP keymaps automatically on every buffer where an LSP server attaches.

| Key | Mode | Action |
|---|---|---|
| `gd` | [n] | Go to definition |
| `gD` | [n] | Go to declaration |
| `gi` | [n] | Go to implementation |
| `gr` | [n] | Go to references |
| `K` | [n] | Hover documentation |
| `<C-k>` | [n] | Signature help |
| `<leader>la` | [n] | Code action |
| `<leader>lr` | [n] | Rename symbol |
| `<leader>lf` | [n] | Format buffer |
| `<leader>ld` | [n] | Telescope: document diagnostics |
| `<leader>lw` | [n] | Telescope: workspace diagnostics |
| `<leader>lj` | [n] | Next diagnostic |
| `<leader>lk` | [n] | Previous diagnostic |
| `<leader>ls` | [n] | Telescope: document symbols |
| `<leader>lS` | [n] | Telescope: workspace symbols |
| `<leader>ds` | [n] | Diagnostics → location list |
| `<leader>fm` | [n, x] | Format file / selection (conform.nvim) |

---

## Lazygit

Requires the `lazygit` CLI (`/opt/homebrew/bin/lazygit`). Opens in a floating window at 90% screen size.

| Key | Mode | Action |
|---|---|---|
| `<leader>gg` | [n] | Open lazygit |
| `<leader>gf` | [n] | Open lazygit focused on current file |
| `<leader>gc` | [n] | Open lazygit commit history for current file |

### Inside lazygit

Lazygit has its own keyboard-driven UI. Key bindings are shown at the bottom of the lazygit window and are configurable in `~/.config/lazygit/config.yml`.

| Key | Action |
|---|---|
| `q` | Quit lazygit |
| `?` | Show keybindings help |
| `<Tab>` | Switch between panels |
| `h` `l` | Navigate panels left / right |
| `j` `k` | Move up / down within a panel |
| `<Space>` | Stage / unstage file or hunk |
| `a` | Stage all files |
| `c` | Commit staged changes |
| `A` | Amend last commit |
| `P` | Push |
| `p` | Pull |
| `b` | Open branch menu |
| `e` | Edit file in Neovim |
| `<Enter>` | Drill into file / expand |

---

## Gitsigns

> Gitsigns registers **no keymaps by default**. The bindings below are defined in `lua/user/whichkey.lua` via the `<leader>g` group.

| Key | Mode | Action |
|---|---|---|
| `<leader>gj` | [n] | Next hunk |
| `<leader>gk` | [n] | Previous hunk |
| `<leader>gl` | [n] | Blame current line |
| `<leader>gp` | [n] | Preview hunk popup |
| `<leader>gr` | [n] | Reset hunk |
| `<leader>gR` | [n] | Reset entire buffer |
| `<leader>gs` | [n] | Stage hunk |
| `<leader>gu` | [n] | Undo stage hunk |
| `<leader>gd` | [n] | Diff against HEAD |

---

## Markview.nvim

Markview renders markdown inline automatically on `BufReadPost` for `.md` files. No global keymaps are registered. All interaction is through `:Markview` commands.

### Preview control

| Command | Action |
|---|---|
| `:Markview` | Toggle preview (global) |
| `:Markview Enable` | Enable preview globally |
| `:Markview Disable` | Disable preview globally |
| `:Markview Toggle` | Toggle preview globally |
| `:Markview enable [buf]` | Enable for a specific buffer |
| `:Markview disable [buf]` | Disable for a specific buffer |

### Hybrid mode (edit near cursor, render elsewhere)

| Command | Action |
|---|---|
| `:Markview HybridToggle` | Toggle hybrid mode |
| `:Markview HybridEnable` | Enable hybrid mode |
| `:Markview HybridDisable` | Disable hybrid mode |
| `:Markview linewiseToggle` | Toggle linewise hybrid mode |

### Split view

| Command | Action |
|---|---|
| `:Markview splitToggle` | Toggle split preview pane |
| `:Markview splitOpen [buf]` | Open split preview |
| `:Markview splitClose` | Close split preview |

---

## Glow.nvim

> **Note:** glow.nvim was archived March 2025. It remains functional but is no longer maintained. Consider `:Markview splitOpen` as an alternative.

Glow requires the `glow` CLI at `/opt/homebrew/bin/glow` (configured in `lua/plugins/init.lua`).

| Command | Action |
|---|---|
| `:Glow` | Preview current markdown buffer in floating window |
| `:Glow [path]` | Preview a specific markdown file |
| `:Glow!` | Close the preview window |

### Inside the Glow preview window

| Key | Action |
|---|---|
| `q` | Close preview |
| `<Esc>` | Close preview |

---

## XLS / CSV viewer

Custom command defined in `lua/plugins/init.lua`. Handles `.csv`, `.xls`, and `.xlsx` files. Files with those extensions also auto-render on open via `BufReadPost`.

| Command | Action |
|---|---|
| `:XLSView` | Render current buffer as an aligned table |

### Inside the XLS viewer buffer

| Key | Action |
|---|---|
| `q` | Close viewer buffer |

---

## NvChad-specific commands

| Command | Action |
|---|---|
| `:NvCheatsheet` | Open the built-in keymap cheatsheet overlay |
| `:Lazy` | Open the Lazy plugin manager UI |
| `:Mason` | Open Mason (LSP / tool installer) |
| `:WhichKey` | Show all registered which-key bindings |
| `:Telescope` | Open Telescope command palette |
| `:NvimTreeToggle` | Toggle file explorer |
| `:NvimTreeFocus` | Focus file explorer |

---

## Tips

**Discovering keymaps at runtime:**
- Press `<leader>` and wait — which-key surfaces all registered leader bindings as a popup.
- `<leader>wK` — show every registered keymap.
- `<leader>sk` — Telescope fuzzy search across all keymaps.
- `:NvCheatsheet` — NvChad's built-in visual cheatsheet.

**Telescope `<C-j>` / `<C-k>` in the picker:**
In insert mode inside a picker, `<C-j>` and `<C-k>` are **not** bound to move the selection — use `<C-n>` and `<C-p>` instead. This surprises most people coming from other fuzzy finders.

**Gitsigns has no default keymaps:**
Every gitsigns binding must be declared manually. The ones in this config live in the `<leader>g` which-key group.
