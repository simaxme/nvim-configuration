-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- theme
    use {
        'navarasu/onedark.nvim',
        commit = 'fdfe7bfff486acd102aae7fb2ff52e7e5f6c2bad'
    }

    -- Statusline and top tab/buffer bar
    use {
        'nvim-lualine/lualine.nvim',
        commit = 'abb03129e0b0b7f4c992b1b4c98245cd4422e7d5'
    }
    use {
        'akinsho/bufferline.nvim',
        commit = 'e70be6232f632d16d2412b1faf85554285036278'
    }


    use {
        'kyazdani42/nvim-tree.lua',
        commit = '2b970635d1ef531355a380258372411576ecad4d'
    }

    -- basic session management
    use {
        'nvim-lua/plenary.nvim',
        commit = '4b7e52044bbb84242158d977a50c4cbcd85070c7'
    }
    use {
        'nvim-telescope/telescope.nvim',
        commit = 'f174a0367b4fc7cb17710d867e25ea792311c418'
    }

    -- comments
    use {
        'numToStr/Comment.nvim',
        commit = 'ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6'
    }

    -- basic git tools
    use {
        'lewis6991/gitsigns.nvim',
        commit = '56e01cb0ea52635854e97bd2dd2587c8ebfab978'
    }
    -- use 'tpope/vim-fugitive'

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
    use {
        'MunifTanjim/prettier.nvim',
        commit = 'f27e94f81c9cd5b0925bf46eabb5570c832bd6a7'
    }

    -- -- syntax
    use 'nvim-treesitter/nvim-treesitter'
    -- use 'nvim-treesitter/nvim-treesitter-context'

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
    use 'simrat39/symbols-outline.nvim'

    use 'windwp/nvim-autopairs'

    use 'glepnir/dashboard-nvim'

    use 'lambdalisue/suda.vim'

    use 'stevearc/dressing.nvim'

    use 'RRethy/vim-illuminate'

    use 'j-hui/fidget.nvim'

    use 'karb94/neoscroll.nvim'

    -- copilot
    use 'zbirenbaum/copilot-cmp'
    use 'zbirenbaum/copilot.lua'

    -- terminal
    use 'akinsho/toggleterm.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'SmiteshP/nvim-navic'
end)
