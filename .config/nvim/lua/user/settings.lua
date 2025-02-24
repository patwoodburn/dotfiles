vim.o.timeout = false
vim.o.ttimeout = false
-- nice line numbers
vim.o.number = true
vim.o.relativenumber = true

-- end of intented line column
vim.o.ruler = true
vim.api.nvim_set_option_value("colorcolumn", "79",{})
-- vim.o.t_Co = 256
-- vim.o.cc = 79
vim.cmd([[highlight ColorColumn ctermbg=9]])

vim.o.cursorline = true

-- don't save dumb files
vim.g.noswapfile = true
vim.opt.autowriteall = true

-- nice braces
vim.o.showmatch = true
-- vim.o.matchParen = true

vim.o.spell = true

-- don't double info
vim.o.showmode = false

-- better clipboard
vim.o.clipboard = "unnamedplus"

-- confterble function writing
vim.o.breakindent = true

-- undo history
vim.o.undofile = true

-- better search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- colmn for signs
vim.o.signcolumn = "yes"

-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- better scrolling
--vim.o.so=999

-- tabs and white space
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true
