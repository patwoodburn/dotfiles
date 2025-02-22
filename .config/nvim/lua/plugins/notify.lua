local plugin = {"rcarriga/nvim-notify"}
plugin.event = "VimEnter"
function plugin.config()
  require("notify").setup({
    background_colour="#000000",
  })
  notify = require("notify")
  vim.notify = notify
end
return plugin
