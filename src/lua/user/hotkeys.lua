vim.api.nvim_set_keymap("", "<Space>", "<Leader>", { noremap = false })

-- tab selection
vim.keymap.set("v", "<Tab>", ">", { noremap = false })
vim.keymap.set("v", "<S-Tab>", "<", { noremap = false })

-- tab current row in normal mode
vim.keymap.set("n", "<Tab>", ">>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })

-- Commenting
vim.keymap.set("n", "<Leader><Tab>", "gcc", { noremap = false, desc = "Comment currnet line" })
vim.keymap.set("v", "<Leader><Tab>", "gcc", { noremap = false, desc = "Comment current selection" })

-- avoid copying
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true })

vim.keymap.set("n", "<Leader>bd", function()
  local cur_buf = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded and buf ~= cur_buf then
      vim.api.nvim_buf_delete(buf, {})
    end
  end

  vim.notify("Closed all other buffers!")
end, { noremap = true, desc = "Delete all buffers except current" })
