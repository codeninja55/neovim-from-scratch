return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Auto-install all LSP servers, formatters, and linters via Mason
  -- Mason package names (kebab-case) are used here, not LSP server names
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Go
        "gopls", "golangci-lint-langserver", "golangci-lint",
        "gofumpt", "goimports", "gotests",

        -- TypeScript / JavaScript
        "typescript-language-server", "eslint-lsp", "biome", "prettier",

        -- Deno
        "deno",

        -- Python
        "pyright", "ruff", "black",

        -- Bash
        "bash-language-server", "shfmt",

        -- Terraform / OpenTofu
        "terraform-ls",

        -- Markdown
        "marksman", "markdownlint-cli2", "markdown-toc",

        -- Data formats
        "json-lsp", "yaml-language-server", "yamllint",

        -- Kubernetes / Helm
        "helm-ls",

        -- Web
        "html-lsp", "css-lsp",

        -- Containers
        "docker-language-server", "docker-compose-language-service",
        "dockerfile-language-server",

        -- GitHub Actions
        "gh-actions-language-server",

        -- Lua
        "lua-language-server", "stylua",

        -- General
        "ast-grep",
      },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Lazygit in a floating window - https://github.com/kdheepak/lazygit.nvim
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
      vim.g.lazygit_use_neovim_remote = 0
    end,
  },

  -- Inline markdown/HTML/LaTeX/Typst renderer - https://github.com/OXY2DEV/markview.nvim
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    init = function()
      -- suppress blink.cmp integration since this config uses nvim-cmp
      vim.g.markview_blink_loaded = true
    end,
    config = function()
      require("markview").setup()
    end,
  },
  -- Markdown preview using the glow CLI - https://github.com/ellisonleao/glow.nvim
  {
    "ellisonleao/glow.nvim",
    cmd = { "Glow" },
    config = function()
      require("glow").setup({
        glow_path = "/opt/homebrew/bin/glow",
        border = "shadow",
        style = "dark",
        pager = true,
        width = 120,
        height = 80,
      })
    end,
  },
  -- xls-viewer - https://github.com/Beargruug/xls-viewer.nvim
  {
    "beargruug/xls-viewer.nvim",
    lazy = false,
    config = function()
      require('xls-viewer').setup({
        python_cmd = '/opt/homebrew/bin/python3',
        max_column_width = 80,
        padding = 2,
      })

      local python_cmd = '/opt/homebrew/bin/python3'

      -- Renders a spreadsheet/CSV file into an aligned read-only buffer.
      -- Accepts .csv, .xls, and .xlsx — uses the appropriate pandas reader.
      local function render_tabular(filepath)
        local ext = filepath:match("%.(%a+)$"):lower()
        local read_call
        if ext == "csv" then
          read_call = string.format("pd.read_csv('%s')", filepath:gsub("\\", "\\\\"):gsub("'", "\\'"))
        else
          read_call = string.format("pd.read_excel('%s')", filepath:gsub("\\", "\\\\"):gsub("'", "\\'"))
        end

        local python_script = string.format([[
import pandas as pd, sys
try:
    df = %s
    print(df.to_csv(sep='\t', index=False))
except Exception as e:
    print(f"Error: {e}", file=sys.stderr)
    sys.exit(1)
]], read_call)

        local cmd = string.format('%s -c "%s"', python_cmd, python_script:gsub('"', '\\"'))
        local output = vim.fn.system(cmd)

        if vim.v.shell_error ~= 0 then
          vim.notify("XLSView: " .. output, vim.log.levels.ERROR)
          return
        end

        local align = require("xls-viewer.align")
        local lines = vim.split(output, "\n", { plain = true })
        local filtered = {}
        for _, line in ipairs(lines) do
          if line ~= "" then table.insert(filtered, line) end
        end

        local aligned = align.align_table(filtered)
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, aligned)
        vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
        vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
        vim.api.nvim_buf_set_option(buf, "swapfile", false)
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_buf_set_option(buf, "filetype", "xls-viewer")
        vim.api.nvim_buf_set_name(buf, filepath .. " [XLS Viewer]")
        vim.api.nvim_set_current_buf(buf)
        vim.keymap.set("n", "q", ":bd<CR>", { buffer = buf, noremap = true, silent = true })
      end

      -- Auto-render when opening CSV, XLS, or XLSX files
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "*.csv", "*.xls", "*.xlsx" },
        callback = function()
          render_tabular(vim.fn.expand("%:p"))
        end,
        group = vim.api.nvim_create_augroup("XLSViewerAuto", { clear = true }),
      })

      vim.api.nvim_create_user_command("XLSView", function()
        render_tabular(vim.fn.expand("%:p"))
      end, { desc = "Render current CSV/XLS/XLSX buffer as an aligned table" })
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
