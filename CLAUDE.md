# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration targeting **Neovim 0.12+**, migrated from packer.nvim to lazy.nvim. It is structured as a modular Lua config under `lua/user/`, with each file responsible for a single plugin or concern.

## Plugin management

Plugins are managed by **lazy.nvim**, which self-bootstraps on first launch. The plugin list lives in `lua/user/plugins.lua`. After modifying it, run `:Lazy sync` inside Neovim to apply changes.

The lockfile is `lazy-lock.json` — commit this when pinning plugin versions.

## Config loading order

`init.lua` is the entry point and requires each module explicitly in load order. Adding a new plugin requires two steps: declare it in `plugins.lua`, and create (or add to) the relevant `lua/user/<name>.lua` module, then `require` it from `init.lua`.

## LSP setup

LSP servers are declared in the `servers` table at the top of `lua/user/lsp/mason.lua`. Mason installs them automatically. Per-server settings live in `lua/user/lsp/settings/<server>.lua` and are merged into the server config automatically by the loop in `mason.lua`.

The config uses `vim.lsp.config` / `vim.lsp.enable` (lspconfig v0.11+ API) — **not** the legacy `lspconfig[server].setup()` pattern.

Formatters and linters are configured via **none-ls** (`nvimtools/none-ls.nvim`) in `lua/user/lsp/null-ls.lua`. The module is still required as `null-ls` internally.

## Key bindings

- Leader key is `Space`
- Which-key surfaces all leader bindings — edit `lua/user/whichkey.lua` to add or change them
- `Space + p` opens the Lazy plugin manager group
- `jk` / `kj` exits insert mode

## Dashboard

The startup dashboard is **alpha-nvim**, configured in `lua/user/alpha.lua`. The footer text and ASCII header are both hardcoded strings in that file — edit them directly.

## Known architectural quirks

- `lua/user/treesitter.lua` defines a `M.config()` function but `init.lua` calls `require "user.treesitter"` without invoking `.config()`. Treesitter is effectively configured only through lazy.nvim's `build = ":TSUpdate"` trigger. Do not add treesitter config inside `M.config()` expecting it to run.
- `lua/user/autocommands.lua` — review before adding new autocommands to avoid duplicates.
