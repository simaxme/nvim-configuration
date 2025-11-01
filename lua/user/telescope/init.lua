local M = {}


require('user.telescope.pickers.nvimtreeactions.init')
require('user.telescope.pickers.buffer.init')


require("telescope").setup({
  -- ... your config
  defaults = {
    borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
  }
  -- ... your config
})

return M
