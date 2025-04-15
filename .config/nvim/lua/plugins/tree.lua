local plugin = { "nvim-tree/nvim-tree.lua" }
plugin.version = "*"
plugin.lazy = false
plugin.dependencies = { "nvim-tree/nvim-web-devicons" }
function plugin.config()
  vim.keymap.set("n", "<leader>tv", vim.cmd.NvimTreeToggle, {desc= "[T]ree [V]iew"})
  require("nvim-tree").setup({
    view = {
      adaptive_size = false,
      side = "left",
      width = 20,
      preserve_window_proportions = true,
    },
    git = {
      enable = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    renderer = {
      -- root_folder_label = true,
      highlight_git = true,
      highlight_opened_files = "none",
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
        },

        glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
                symlink_open = "",
                arrow_open = "",
                arrow_closed = "",
            },
            git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
            },
        },
      },
    },
  })
end
return plugin
