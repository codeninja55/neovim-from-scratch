require("nvchad.configs.lspconfig").defaults()

-- Only actual LSP server names belong here — Mason package names (dashes) differ
-- from LSP server names (underscores). Formatters and linters go in conform.lua
-- and are installed via mason-tool-installer in plugins/init.lua.
--
-- ts_ls and denols both claim .ts files. Root-marker configs in lua/lsp/ts_ls.lua
-- and lua/lsp/denols.lua prevent them from starting in each other's projects.

local servers = {
  -- Go
  "gopls",
  "golangci_lint_ls",  -- golangci-lint issues as LSP diagnostics (needs .golangci.yml)

  -- TypeScript / JavaScript — Node.js and Bun
  "ts_ls",             -- typescript-language-server
  "eslint",            -- eslint-lsp
  "biome",

  -- TypeScript — Deno (root conflict with ts_ls resolved via lua/lsp/ configs)
  "denols",

  -- Python
  "pyright",

  -- Bash / Shell
  "bashls",            -- bash-language-server

  -- Terraform / OpenTofu
  "terraformls",       -- terraform-ls

  -- Markdown
  "marksman",          -- semantic markdown LSP (links, headings, completions)

  -- Data and config formats
  "jsonls",            -- json-lsp
  "yamlls",            -- yaml-language-server (covers k8s manifests via schemas)

  -- Kubernetes / Helm
  "helm_ls",           -- helm-ls

  -- Web
  "html",
  "cssls",

  -- Containers
  "dockerls",                        -- docker-language-server (Dockerfiles)
  "docker_compose_language_service", -- docker-compose.yml

  -- GitHub Actions
  "github_actions_ls",               -- gh-actions-language-server
}

vim.lsp.enable(servers)
