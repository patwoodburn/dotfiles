local plugin = { "renerocksai/telekasten.nvim" }
plugin.dependencies = { "nvim-telescope/telescope.nvim" }
function plugin.config()
  require('telekasten').setup({
    auto_set_filetype = false,
    home = vim.fn.expand("~/Documents/Notes")
  })
end
return plugin
