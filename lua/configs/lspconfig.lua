require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "gopls",
  "gofumpt",
  "goimports",
  "gotests",
  "golangci-lint",
  "golangci-lint-langserver",
  "gh",
  "yamllint",
  "yq",
  "gh-actions-language-server",
  "markdown-toc",
  "markdownlint-cli2",
  "deno",
  "typescript-language-server",
  "ts-standard",
  "biome",
  "prettier",
  "eslint-lsp",
  "glow",
  "ast-grep",
  "docker-language-server",
  "dockerfile-language-server",
  "docker-compose-language-service"
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
