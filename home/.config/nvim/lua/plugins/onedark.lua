local plugin = { "navarasu/onedark.nvim" }
function plugin.config ()
  require('onedark').setup{
    style = 'deep',
    transparent = true,
  }
  --require('onedark').load()
end
return plugin
