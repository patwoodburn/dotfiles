local plugin = { "renerocksai/telekasten.nvim" }
plugin.dependencies = { "nvim-telescope/telescope.nvim" }
function plugin.config()
  require('telekasten').setup({
    auto_set_filetype = false,
    home = vim.fn.expand("~/Documents/Notes")
  })
  vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { desc = "[Z]edlecasten [F]ind" })
  vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", { desc = "[Z]edlecasten [G]oto Note" })
  vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", { desc = "[Z]edlecasten [D]ay" })
  vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten fallow_link<CR>", { desc = "[[Z]]edlecasten goto link"})
  vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { desc = "[Z]edlecasten new"})
end

return plugin
