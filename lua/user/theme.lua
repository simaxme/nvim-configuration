require('onedark').setup {
    style = 'deep',

    highlights = {
        CocFloating = {bg = "#ff0000"},
        Pmenu = {bg = "#ff0000"}
    }
}
require('onedark').load()

vim.cmd [[
    set termguicolors
	set number
	set noshowmode
	set cursorline

    autocmd VimEnter * hi Pmenu guibg=NONE
    autocmd VimEnter * hi PmenuSel guibg=#bd93f9
    
 ]]

