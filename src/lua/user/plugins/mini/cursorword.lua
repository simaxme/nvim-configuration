require('mini.cursorword').setup()

vim.api.nvim_set_hl(0, 'MiniCursorword', { default = false, bold = true })
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { default = false, bold = true })
