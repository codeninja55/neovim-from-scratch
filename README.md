# neovim-from-scratch

Personal Neovim configuration built on [NvChad v2.5](https://github.com/NvChad/NvChad). Targets **Neovim 0.12+** on macOS and Ubuntu Linux.

## Requirements

| Dependency | Version | Notes |
|---|---|---|
| [Neovim](https://neovim.io) | 0.12+ | See platform-specific install below |
| [JetBrains Mono Nerd Font](https://www.nerdfonts.com) | any | Required for icons and glyphs |
| [lazygit](https://github.com/jesseduffield/lazygit) | any | Required by lazygit.nvim |
| [glow](https://github.com/charmbracelet/glow) | any | Required by glow.nvim for markdown preview |
| Python 3 | 3.7+ | Required by xls-viewer.nvim |

Optional (macOS):

| Dependency | Notes |
|---|---|
| [Ghostty](https://ghostty.org) | Terminal emulator — requires `macos-option-as-alt = true` |
| [tmux](https://github.com/tmux/tmux) | Requires `escape-time 0` and `extended-keys always` |

---

## Installing Neovim

This config requires Neovim 0.12 or later.

### macOS

Install Neovim and supporting tools via [Homebrew](https://brew.sh):

```sh
brew install neovim lazygit glow
```

Python packages for xls-viewer.nvim:

```sh
python3 -m pip install pandas openpyxl xlrd
```

### Ubuntu Linux

> **Do not use `apt install neovim`** — the version in Ubuntu's default repositories is outdated and will not meet the 0.12+ requirement.

The recommended approach is the pre-built archive from GitHub Releases. This always provides the latest stable version.

**1. Download and install the pre-built archive**

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

**2. Add Neovim to your PATH**

Add the following to `~/.bashrc` or `~/.zshrc`:

```sh
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

Then reload your shell:

```sh
source ~/.bashrc  # or source ~/.zshrc
```

**3. Verify the version**

```sh
nvim --version
```

Confirm the output shows `v0.12` or later.

**4. Install supporting tools**

```sh
sudo apt-get update
sudo apt-get install -y lazygit glow python3 python3-pip
python3 -m pip install pandas openpyxl xlrd
```

If `lazygit` is not available via apt, install it from the [lazygit releases page](https://github.com/jesseduffield/lazygit#installation). Similarly, `glow` can be installed from the [glow releases page](https://github.com/charmbracelet/glow#installation) if needed.

---

## Installation

> If you already have a Neovim config at `~/.config/nvim`, back it up first.

### 1. Clone the repo

```sh
git clone git@github.com:codeninja55/neovim-from-scratch.git ~/path/to/neovim-from-scratch
```

### 2. Symlink as your Neovim config

```sh
# Back up existing config if present
mv ~/.config/nvim ~/.config/nvim.bak

# Symlink the repo
ln -s ~/path/to/neovim-from-scratch ~/.config/nvim
```

Any edits to the repo are immediately live in Neovim, and git tracks all changes.

### 3. Launch Neovim

```sh
nvim
```

On first launch, lazy.nvim bootstraps itself and installs all plugins automatically. Wait for the installation to complete, then restart Neovim.

---

## Ghostty configuration

Two settings are required in your `~/.config/ghostty/config` for Alt-key mappings to reach Neovim through tmux:

```
macos-option-as-alt = true
```

This makes the Option key send Alt escape sequences instead of macOS special characters (e.g. `∑` for Option+W). A full Ghostty restart is required after changing this — config reload is not sufficient.

---

## tmux configuration

The following settings are required in `~/.tmux.conf` for Alt-key combos and kitty keyboard protocol to pass through to Neovim:

```tmux
set -s escape-time 0          # prevents Alt sequences being split into Esc + key
set -s extended-keys always   # passes kitty keyboard protocol sequences
set -as terminal-features 'xterm-ghostty:extkeys'
```

Without `escape-time 0`, pressing `<A-w>` in Neovim is received as `<Esc>` followed by `w` — closing menus and moving the cursor instead of triggering the mapping.

---

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point — bootstraps lazy.nvim, loads plugins
├── lazy-lock.json            # Pinned plugin versions
├── lua/
│   ├── chadrc.lua            # NvChad theme and UI config
│   ├── options.lua           # Neovim options (extends nvchad.options)
│   ├── mappings.lua          # Keymaps entry point (extends nvchad.mappings)
│   ├── autocmds.lua          # Autocommands
│   ├── plugins/
│   │   └── init.lua          # User plugin declarations (lazy.nvim specs)
│   ├── configs/
│   │   ├── lspconfig.lua     # LSP server list
│   │   ├── conform.lua       # Formatter config
│   │   └── lazy.lua          # lazy.nvim options
│   └── user/
│       ├── keymaps.lua       # Additional keymaps (required from mappings.lua)
│       └── whichkey.lua      # Legacy which-key groups (reference only)
└── docs/
    └── keymaps.md            # Full keymap reference
```

### How NvChad loads config

`init.lua` calls `require("lazy").setup()` with two sources:

1. `import = "nvchad.plugins"` — NvChad's built-in plugin set (telescope, treesitter, mason, gitsigns, etc.)
2. `import = "plugins"` — your additions in `lua/plugins/init.lua`

User modules are loaded in this order:
```
options.lua → autocmds.lua → mappings.lua (→ user.keymaps)
```

### Adding a plugin

Add a lazy.nvim spec to `lua/plugins/init.lua`, then run `:Lazy sync` in Neovim.

```lua
{
  "owner/plugin-name",
  cmd = { "PluginCommand" },   -- lazy-load trigger
  config = function()
    require("plugin-name").setup({ ... })
  end,
},
```

### Adding a keymap

Add mappings to `lua/mappings.lua` for NvChad-aware mappings, or `lua/user/keymaps.lua` for additional bindings (both are loaded at startup).

```lua
-- lua/mappings.lua
local map = vim.keymap.set
map("n", "<leader>xx", "<cmd>SomeCommand<CR>", { desc = "do something" })
```

---

## Installed plugins

| Plugin | Purpose | Trigger |
|---|---|---|
| [NvChad/NvChad](https://github.com/NvChad/NvChad) | Base UI, themes, tabufline, cheatsheet | always |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client config | always |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting | always |
| [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Inline markdown renderer | always |
| [ellisonleao/glow.nvim](https://github.com/ellisonleao/glow.nvim) | Markdown float preview via glow CLI | `:Glow` |
| [beargruug/xls-viewer.nvim](https://github.com/Beargruug/xls-viewer.nvim) | CSV / XLS / XLSX viewer | `BufReadPost`, `:XLSView` |
| [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Lazygit in a floating window | `:LazyGit` |

NvChad also ships: telescope, nvim-tree, treesitter, mason, gitsigns, which-key, indent-blankline, nvim-cmp, LuaSnip, and more. See `lazy-lock.json` for pinned versions.

---

## Key customisations

### Alt key fix (`ttimeoutlen`)

`lua/options.lua` sets `vim.opt.ttimeoutlen = 10`. Without this, terminal Neovim misinterprets Alt+key sequences as a standalone `Esc` followed by a regular key. This affects all `<A-x>` mappings including `<A-w>` (close buffer) and `<A-j>`/`<A-k>` (move lines).

### Keymaps

See [`docs/keymaps.md`](docs/keymaps.md) for the full reference including core Neovim motions, NvChad defaults, custom mappings, Telescope picker bindings, nvim-tree bindings, LSP, lazygit, and more.

Notable custom bindings:

| Key | Action |
|---|---|
| `<A-w>` | Close current tabufline buffer |
| `<A-j>` / `<A-k>` | Move current line down / up |
| `<leader>gg` | Open lazygit |
| `<leader>gf` | Open lazygit for current file |
| `<Space><Up/Down/Left/Right>` | Resize splits |
| `jk` / `kj` | Exit insert mode |
| `;` | Enter command mode |

### NvDash

The NvChad dashboard loads on startup (no file argument). Configured in `lua/chadrc.lua`:

```lua
M.nvdash = { load_on_startup = true }
```

---

## Troubleshooting

**Plugins not appearing in `:Lazy` after adding them**
Check `lua/plugins/init.lua` for Lua errors — a single failed `require` in the returned table aborts spec loading silently. Run `:messages` after startup to see any errors.

**Alt key mappings not working**
1. Confirm `macos-option-as-alt = true` in Ghostty config and restart Ghostty fully (not just reload).
2. Confirm `set -s escape-time 0` in `~/.tmux.conf`.
3. In Neovim insert mode, press `Ctrl+V` then `Option+key` — you should see `<M-x>`. If you see a special character like `∑`, Ghostty hasn't picked up the setting.

**Symlink not pointing to repo**
```sh
ls -la ~/.config/nvim
# Should show: ~/.config/nvim -> /path/to/neovim-from-scratch
```
