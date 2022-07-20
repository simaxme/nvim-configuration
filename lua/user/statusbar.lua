local function getCOCStatus()
    return vim.api.nvim_eval('coc#status()');
end

require('lualine').setup {
    sections = {
        lualine_y = {getCOCStatus},
        lualine_z = {'progress', 'location'}
    }
}

vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        offsets = {
            {
                filetype = "nerdtree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
}
