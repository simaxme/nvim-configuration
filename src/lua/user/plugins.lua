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
  'nvim-lualine/lualine.nvim',
  'akinsho/bufferline.nvim',

  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',


  -- basic git tools
  'lewis6991/gitsigns.nvim',
  -- 'sindrets/diffview.nvim',

  -- auto completion
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/nvim-cmp',

  -- external lsp servers for config
  'mfussenegger/nvim-jdtls',

  -- -- syntax
  'nvim-treesitter/nvim-treesitter',

  -- TODO change
  'kyazdani42/nvim-tree.lua',

  'rcarriga/nvim-notify',

  -- icon support
  -- 'ryanoasis/vim-devicons',
  -- 'kyazdani42/nvim-web-devicons',

  -- css color highlighting
  -- TODO LOOK HERE

  -- html
  'windwp/nvim-ts-autotag',


  'windwp/nvim-autopairs',

  -- require("user.plugins.noice"),

  'MunifTanjim/nui.nvim',

  'j-hui/fidget.nvim',

  -- copilot
  -- 'zbirenbaum/copilot-cmp',
  -- 'zbirenbaum/copilot.lua',

  -- terminal
  'akinsho/toggleterm.nvim',

  -- 'SmiteshP/nvim-navic',

  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  'nmac427/guess-indent.nvim',

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.0.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  },

  'saadparwaiz1/cmp_luasnip',


  {
    "simaxme/nvim-tree-angular",
    config = function()
      require("nvim-tree-angular").setup()
    end
  },

  require("user.plugins.monokai"),
  require("user.plugins.possession"),
  require("user.plugins.dashboard"),
  require("user.plugins.mini"),
  require("user.plugins.neogen")
})
