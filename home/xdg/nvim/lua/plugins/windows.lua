local plugin = { "anuvyklack/windows.nvim" }
plugin.dependencies = {
  "anuvyklack/middleclass",
  "anuvyklack/animation.nvim",
}
function plugin.config()
  vim.o.winwidth = 10
  vim.o.winminwidth = 10
  vim.o.equalalways = false
  require("windows").setup()
end
return plugin
