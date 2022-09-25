vim.cmd [[
	set clipboard=unnamedplus

    set modifiable
    set number relativenumber

    set cmdheight=2
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set scrolloff=5

	set autoindent
	set smartindent
	set breakindent

	set mouse=a

    set shortmess+=O
    set shortmess+=F

    set laststatus=3

    autocmd ColorScheme * highlight VertSplit guibg=None guifg=#191724
]]
