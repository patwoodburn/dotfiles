local plugin = {"nvimdev/dashboard-nvim"}
plugin.event = "VimEnter"
function plugin.config()
  require("dashboard").setup({
    config = {
      week_header = {
        enable = true,
      },
    },
	})
end

return plugin
