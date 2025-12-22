vim.keymap.set("n", "<C-s>", function() vim.lsp.buf.definition() end,
  { noremap = true, desc = "Jump to definition of current symbol" })
vim.keymap.set("n", "<C-c>", ":Telescope lsp_references<CR>",
  { noremap = true, desc = "Jump to references of current symbol" })
vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, { noremap = true, desc = "Rename current symbol" })
vim.keymap.set("n", "<Leader>w", function() vim.lsp.buf.code_action() end,
  { desc = "Show code actions for at the current cursor location" })
vim.keymap.set("", "<C-h>", function() vim.lsp.buf.hover() end, { desc = "Show definition preview of current symbol" })
