local plugin = { 'nvim-lualine/lualine.nvim' }
plugin.dependencies = { 'nvim-tree/nvim-web-devicons' , "dracula/vim" }
function plugin.config ()
  require('lualine').setup{
    options = {
      icons_enabled = true,
      theme = drucula,
    },
  }
end
return plugin
