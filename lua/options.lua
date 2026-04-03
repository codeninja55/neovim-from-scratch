require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Allow Alt/Meta key combos (e.g. <A-w>) to be recognised in terminal Neovim.
-- Without this, the ESC byte that precedes a Meta sequence gets flushed before
-- the second character arrives, so <A-w> is seen as <Esc> then w.
vim.opt.ttimeoutlen = 10

