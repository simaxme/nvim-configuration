-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- theme
    use 'navarasu/onedark.nvim'

    -- Statusline and top tab/buffer bar
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'


    use 'kyazdani42/nvim-tree.lua'

    -- basic session management
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- comments
    use 'numToStr/Comment.nvim'

    -- basic git tools
    use 'lewis6991/gitsigns.nvim'
    use 'sindrets/diffview.nvim'

    -- auto completion
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'arkav/lualine-lsp-progress'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/nvim-cmp'

    -- external lsp servers for config
    use 'mfussenegger/nvim-jdtls'
    use 'MunifTanjim/prettier.nvim'

    -- -- syntax
    use 'nvim-treesitter/nvim-treesitter'

    use 'rcarriga/nvim-notify'

    -- icon support
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    -- css color highlighting
    use 'ap/vim-css-color'

    -- numbertoggle
    use 'andweeb/presence.nvim'
    -- html
    use 'windwp/nvim-ts-autotag'

    -- method summary
    use 'simrat39/symbols-outline.nvim'

    use 'windwp/nvim-autopairs'

    use 'glepnir/dashboard-nvim'

    use 'lambdalisue/suda.vim'

    use 'stevearc/dressing.nvim'

    use 'RRethy/vim-illuminate'

    use 'MunifTanjim/nui.nvim'

    use 'j-hui/fidget.nvim'

    use 'karb94/neoscroll.nvim'

    -- copilot
    -- use 'zbirenbaum/copilot-cmp'
    -- use 'zbirenbaum/copilot.lua'

    -- terminal
    use 'akinsho/toggleterm.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'SmiteshP/nvim-navic'

    use 'antosha417/nvim-lsp-file-operations'
end)
