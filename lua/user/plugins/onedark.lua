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
        autocmd VimEnter * hi IlluminatedWordRead gui=bold cterm=bold
        autocmd VimEnter * hi IlluminatedWordWrite gui=bold cterm=bold
        autocmd VimEnter * hi IlluminatedWordText gui=bold cterm=bold
     ]]
end

return {
    'navarasu/onedark.nvim',
    config = setup
}
