
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

	-- theme
	use 'navarasu/onedark.nvim'	

	use 'puremourning/vimspector'

	-- Statusline and top tab/buffer bar
	-- use 'vim-airline/vim-airline'
	-- use 'vim-airline/vim-airline-themes'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'

	-- Nerdtree (File Navigator)
	use 'preservim/nerdtree'
	use 'Xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

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
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}

	-- syntax
	use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-angular'

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

    -- required for rounded corners
    use 'neovim/nvim-lspconfig'

    -- copilot must have
    use 'github/copilot.vim'

    use 'Shougo/echodoc.vim'

    use 'glepnir/dashboard-nvim'
end)
