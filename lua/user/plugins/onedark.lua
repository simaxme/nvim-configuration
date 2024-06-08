local function setup()
    require('onedark').setup {
        style = 'deep',

        highlights = {
            CocFloating = { bg = "#ff0000" },
            Pmenu = { bg = "#ff0000" }
        }
    }
    require('onedark').load()

    vim.cmd [[
        set termguicolors
        set number
        set noshowmode
        set cursorline

        autocmd VimEnter * hi Pmenu guibg=NONE
        autocmd VimEnter * hi FloatBorder guifg=white guibg=bg
        autocmd VimEnter * hi TreesitterContext guifg=white guibg=bg
        autocmd VimEnter * hi NormalFloat guibg=bg guifg=white
     ]]
end

return {
    'navarasu/onedark.nvim',
    config = setup
}
