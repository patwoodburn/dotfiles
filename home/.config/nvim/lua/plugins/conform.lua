local plugin = { "stevearc/conform.nvim" }
plugin.event = { "BufWritePre" }
plugin.cmd = { "ConformInfo" }
plugin.keys = {
  {
    "<leader>f",
    function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end,
    mode = "",
    desc = "[f]ormat buffer",
  },
}
plugin.opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    java = { "checkstyle" },
  },
}
return plugin
