vim.opt.clipboard = "unnamedplus"
vim.opt.modifiable = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.mouse = "a"
vim.opt.shortmess = vim.opt.shortmess + "OF"
vim.opt.laststatus = 3
vim.opt.wrap = false
vim.opt.updatetime = 1000 -- faster cursor hold event
vim.opt.swapfile = false
vim.opt.ignorecase = true


vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end
})

vim.opt.guifont = { "CaskaydiaCove Nerd Font", ":h12" }
