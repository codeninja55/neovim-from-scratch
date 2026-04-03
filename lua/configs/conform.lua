local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },

    -- Go: goimports first (handles imports + base formatting), gofumpt second (stricter style)
    go = { "goimports", "gofumpt" },

    -- TypeScript / JavaScript: biome is faster; fall back to prettier if no biome config
    typescript = { "biome", "prettier", stop_after_first = true },
    javascript = { "biome", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettier", stop_after_first = true },

    -- Python: ruff_format is fast and handles isort; fall back to black
    python = { "ruff_format", "black", stop_after_first = true },

    -- Shell / Bash
    sh = { "shfmt" },
    bash = { "shfmt" },

    -- Terraform / OpenTofu
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },

    -- Data and config formats
    json = { "biome", "prettier", stop_after_first = true },
    jsonc = { "biome", "prettier", stop_after_first = true },
    yaml = { "prettier" },

    -- Markup
    markdown = { "prettier" },

    -- Web
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
