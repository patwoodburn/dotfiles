local plugin = { "dracula/vim" }

plugin.lazy = false

function plugin.config ()
  -- silent! colorscheme dracula
  vim.g.dracula_colorterm = 0
  vim.cmd.colorscheme("dracula")
  vim.g.dracula_colorterm = 0
end
return plugin
