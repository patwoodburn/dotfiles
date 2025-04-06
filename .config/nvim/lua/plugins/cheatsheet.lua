local cheatsheet = {'smartinellimarco/nvcheatsheet.nvim'}
cheatsheet.opts = {
  header = {
    "                                      ",
    "                                      ",
    "                                      ",
    "█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
    "█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
    "                                      ",
    "                                      ",
    "                                      ",
  },
  keymaps = {
    ['lsp'] = {
      {"lsp go to delcleration","<leader>gD"},
    },
  }
}
function cheatsheet.config(_, opts)
  local nvcheatsheet = require('nvcheatsheet')
  nvcheatsheet.setup(opts)
  vim.keymap.set('n', '<leader>cs', nvcheatsheet.toggle)
end

--function cheatsheet.highlight(palette, opts)
--  return {
--    NvChAsciiHeader = { bg = palette.bg, fg = palette.fg }, -- Title
--    NvChSection = { bg = palette.alt_bg }, -- Each card
--
--    -- Colors for the headers
--    NvCheatsheetWhite = { bg = palette.white, fg = palette.bg },
--    NvCheatsheetGray = { bg = palette.gray, fg = palette.fg },
--    NvCheatsheetBlue = { bg = palette.blue, fg = palette.bg },
--    NvCheatsheetCyan = { bg = palette.cyan, fg = palette.bg },
--    NvCheatsheetRed = { bg = palette.red, fg = palette.fg },
--    NvCheatsheetGreen = { bg = palette.green, fg = palette.bg },
--    NvCheatsheetYellow = { bg = palette.yellow, fg = palette.bg },
--    NvCheatsheetOrange = { bg = palette.orange, fg = palette.bg },
--    NvCheatsheetPurple = { bg = palette.purple, fg = palette.fg },
--    NvCheatsheetMagenta = { bg = palette.magenta, fg = palette.bg },
--  }
--end

return cheatsheet
