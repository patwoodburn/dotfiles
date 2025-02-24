local plugin = {"chipsenkbeil/org-roam.nvim"}
plugin.tag ="0.1.1"
plugin.dependencies = {
  {
    "nvim-orgmode/orgmode",
    tag = "0.3.7",
    event = "VeryLazy",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/org/agenda/**/*",
        org_default_notes_file = "~/org/refile.org",
      })
    end
  }
}

function plugin.config()
  require("org-roam").setup({
    directory = "~/org/roam_files",
    database = {
      path = "~/org/roam_db",
      persist = false,
    },
  })
end

return plugin
