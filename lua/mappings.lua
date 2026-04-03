require "nvchad.mappings"
require "user.keymaps"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<A-w>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "lazygit" })
map("n", "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", { desc = "lazygit current file" })
map("n", "<leader>gc", "<cmd>LazyGitFilterCurrentFile<CR>", { desc = "lazygit file commits" })

-- markdown-preview (browser preview — complements markview inline rendering)
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "markdown preview toggle" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "markdown preview stop" })

-- which-key v3 group labels
-- which_key.add() queues registrations safely even before which-key loads
vim.schedule(function()
  local ok, wk = pcall(require, "which-key")
  if not ok then return end
  wk.add({
    { "<leader>a", group = "claude code" },
    { "<leader>g", group = "git" },
    { "<leader>l", group = "lsp" },
    { "<leader>m", group = "markdown" },
    { "<leader>s", group = "search" },
    { "<leader>t", group = "terminal" },
    { "<leader>p", group = "lazy" },
    { "<leader>w", group = "whichkey" },
  })
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
