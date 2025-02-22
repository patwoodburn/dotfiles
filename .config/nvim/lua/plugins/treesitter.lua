local plugin = {	"nvim-treesitter/nvim-treesitter" }
plugin.build = ":TSUpdate"
function plugin.config()
  local configs = require("nvim-treesitter.configs")
	configs.setup({
		ensure_installed = { "lua", },
    ignore_install = {"org"},
		auto_install = true,
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	})
end
return plugin
