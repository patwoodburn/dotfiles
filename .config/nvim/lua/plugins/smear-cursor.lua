local plugin = { "sphamba/smear-cursor.nvim" }
function plugin.config()
  require("smear_cursor").enabled = true
end

return plugin
