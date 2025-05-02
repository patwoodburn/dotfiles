local plugin = { "folke/trouble.nvim" }
plugin.event = VimEnter
function plugin.config()
  require("trouble").setup({})
  vim.keymap.set("n", "<leader>tt", function()
    require("trouble").toggle()
  end)
end
return plugin
