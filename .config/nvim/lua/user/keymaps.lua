vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better splits
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { noremap = true })
vim.keymap.set("n", "<leader>s-", ":split<Cr>", { noremap = true })
vim.keymap.set("n", "<leader>sz", ":vsplit<Cr>", { noremap = true })
