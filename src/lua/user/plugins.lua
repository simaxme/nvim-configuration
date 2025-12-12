-- automatically install lazy

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Packer can manage itself
  'wbthomason/packer.nvim',

  -- Statusline and top tab/buffer bar
  require('user.plugins.lualine'),

  -- basic git tools
  require('user.plugins.gitsigns'),

  require('user.plugins.lsp.init'),

  require('user.plugins.treesitter'),
  require('user.plugins.telescope'),

  require('user.plugins.notify'),

  -- icon support
  -- 'ryanoasis/vim-devicons',
  -- 'kyazdani42/nvim-web-devicons',

  -- css color highlighting
  -- TODO LOOK HERE

  -- html
  require('user.plugins.html_autotag'),

  -- 'MunifTanjim/nui.nvim',

  require('user.plugins.fidget'),

  -- copilot
  -- 'zbirenbaum/copilot-cmp',
  -- 'zbirenbaum/copilot.lua',

  -- 'SmiteshP/nvim-navic',

  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  require("user.plugins.cmp"),
  require("user.plugins.theme"),
  require("user.plugins.mini"),
  require("user.plugins.neogen"),
  require("user.plugins.oil"),
  require("user.plugins.linter.init"),
  require("user.plugins.snacks"),
  require("user.plugins.autopairs"),
})
