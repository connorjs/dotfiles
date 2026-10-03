-- Plain text editor. No plugins (yet): learn the built-ins first (`:Tutor`, `:help`).
-- Neovim picks light/dark from the terminal background, so no colorscheme is set.
-- Markdown highlighting is built in (bundled treesitter parser), so no plugin needed.

vim.o.number = true -- Line numbers in the gutter
vim.o.laststatus = 2 -- Always show the status line...
vim.o.ruler = true -- ...with line,column on the right
vim.o.tabstop = 3
vim.o.shiftwidth = 3 -- Same as tabstop

-- Share the system clipboard (`:help clipboard`)
vim.o.clipboard = "unnamedplus"

-- Case-insensitive search unless the term has a capital letter (or \C)
vim.o.ignorecase = true
vim.o.smartcase = true

-- Persist undo history across sessions
vim.o.undofile = true

-- Show trailing whitespace and non-breaking spaces (`:help listchars`)
vim.o.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
