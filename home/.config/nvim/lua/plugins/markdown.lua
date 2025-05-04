local plugin = {'MeanderingProgrammer/render-markdown.nvim'}
plugin.dependencies = {
	"nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-web-devicons",
  "renerocksai/telekasten.nvim"
}
function plugin.config()
  require('render-markdown').setup({
    file_types = { 'markdown', 'telekasten'}
  })
end
plugin.opts = {}
return plugin
