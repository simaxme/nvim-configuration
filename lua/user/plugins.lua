
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

	-- theme
	use 'navarasu/onedark.nvim'

	use 'puremourning/vimspector'

    use 'mfussenegger/nvim-jdtls'

	-- Statusline and top tab/buffer bar
	-- use 'vim-airline/vim-airline'
	-- use 'vim-airline/vim-airline-themes'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'

	-- Nerdtree (File Navigator)
	-- use 'preservim/nerdtree'
	-- use 'Xuyuanp/nerdtree-git-plugin'
    -- use 'tiagofumo/vim-nerdtree-syntax-highlight'

    use 'kyazdani42/nvim-tree.lua'

	-- basic session management
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'PhilRunninger/bufselect.vim'    

    use 'rmagatti/auto-session'
	use 'rmagatti/session-lens'

	-- comments
	use 'preservim/nerdcommenter'

	-- vifm ("bigger" file navigator)
	use 'vifm/vifm.vim'

	-- basic git tools
    use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'

	-- Markdown support
	use 'godlygeek/tabular'
	use 'preservim/vim-markdown'

	-- auto completion
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'arkav/lualine-lsp-progress'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/nvim-cmp'

	-- -- syntax
	use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'

    use 'rcarriga/nvim-notify'

	-- icon support
	use 'ryanoasis/vim-devicons'
	use 'kyazdani42/nvim-web-devicons'

	-- css color highlighting
	use 'ap/vim-css-color'

	-- numbertoggle
	use 'andweeb/presence.nvim'

	-- html
	use 'alvan/vim-closetag'

    -- method summary
    use 'preservim/tagbar'

	use 'Raimondi/delimitMate'

    use 'Shougo/echodoc.vim'

    use 'glepnir/dashboard-nvim'

    use 'lambdalisue/suda.vim'

    -- use {
      -- "AckslD/nvim-neoclip.lua",
      -- requires = {
        -- -- you'll need at least one of these
        -- -- {'nvim-telescope/telescope.nvim'},
        -- {'ibhagwan/fzf-lua'},
      -- },
      -- config = function()
        -- require('neoclip').setup()
      -- end,
    -- }
end)
