-- Automatically install packer
-- local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
-- 	PACKER_BOOTSTRAP = vim.fn.system({
-- 		"git",
-- 		"clone",
-- 		"--depth",
-- 		"1",
-- 		"https://github.com/wbthomason/packer.nvim",
-- 		install_path,
-- 	})
-- 	print("Installing packer close and reopen Neovim...")
-- 	vim.cmd([[packadd packer.nvim]])
-- end

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

    -- theme
    'navarasu/onedark.nvim',

    -- Statusline and top tab/buffer bar
    'nvim-lualine/lualine.nvim',
    'akinsho/bufferline.nvim',


    'kyazdani42/nvim-tree.lua',

    -- basic session management
    'rmagatti/auto-session',
    -- 'rmagatti/session-lens',

    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',

    -- comments
    'numToStr/Comment.nvim',

    -- basic git tools
    'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',

    -- auto completion
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'arkav/lualine-lsp-progress',
    "antosha417/nvim-lsp-file-operations",


    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/nvim-cmp',


    -- external lsp servers for config
    'mfussenegger/nvim-jdtls',
    'MunifTanjim/prettier.nvim',
    'jose-elias-alvarez/typescript.nvim',

    -- -- syntax
    'nvim-treesitter/nvim-treesitter',

    'rcarriga/nvim-notify',

    -- icon support
    'ryanoasis/vim-devicons',
    'kyazdani42/nvim-web-devicons',

    -- css color highlighting
    'ap/vim-css-color',

    'andweeb/presence.nvim',
    -- html
    'windwp/nvim-ts-autotag',

    -- method summary
    'simrat39/symbols-outline.nvim',

    'windwp/nvim-autopairs',

    'glepnir/dashboard-nvim',

    'lambdalisue/suda.vim',

    'stevearc/dressing.nvim',

    'RRethy/vim-illuminate',

    'MunifTanjim/nui.nvim',

    {
        'j-hui/fidget.nvim',
        tag = "legacy"
    },

    -- copilot
    'zbirenbaum/copilot-cmp',
    'zbirenbaum/copilot.lua',

    -- terminal
    'akinsho/toggleterm.nvim',

    'jose-elias-alvarez/null-ls.nvim',

    'SmiteshP/nvim-navic'
})

-- require('packer').startup(function(use)
--
--
--     -- 'antosha417/nvim-lsp-file-operations'
--
--     if PACKER_BOOTSTRAP then
--         require("packer").sync()
--     end
-- end)
