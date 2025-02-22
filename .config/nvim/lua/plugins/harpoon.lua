local plugin = { "ThePrimeagen/harpoon" }
plugin.branch = "harpoon2"
plugin.dependencies = { "nvim-tlescope/telescope.nvim" }
function plugin.config()
  -- harpoon config largly authors config until i decide otherwise
  local harpoon = require("harpoon")
  harpoon:setup({})
  vim.keymap.set("n", "<leader>hs", ":Telescope harpoon marks<Cr>", { noremap = true, desc = "[H]arpoon [S]how marks"})
  vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
  end, { noremap = true, desc = "[H]arpoon [A]dd"})
  vim.keymap.set("n", "<leader>hh", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)
  vim.keymap.set("n", "<leader>h1", function()
    harpoon:list():select(1)
  end)
  vim.keymap.set("n", "<leader>h2", function()
    harpoon:list():select(2)
  end)
  vim.keymap.set("n", "<leader>h3", function()
    harpoon:list():select(3)
  end)
  vim.keymap.set("n", "<leader>h4", function()
    harpoon:list():select(4)
  end)
  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<C-S-p>", function()
    harpoon:list():prev()
  end)
  vim.keymap.set("n", "<C-S-n>", function()
    harpoon:list():next()
  end)
  vim.keymap.set("n", "<leader>hr", function()
    harpoon:list():remove()
  end, { noremap = true, desc = "[H]arpoon [R]emove"})
end
return plugin
