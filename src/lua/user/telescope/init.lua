local M = {}


require('user.telescope.pickers.buffer.init')


require("telescope").setup({
  defaults = {
    borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
  }
})

return M
