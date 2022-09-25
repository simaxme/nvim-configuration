local utils = require('user.utils')

local x  = {}

local c = nil

local y = 0

local function escapeString(str)
    local result = ""
    for i = 1, string.len(str) do
        local s = string.sub(str, i, i)

        if s:match("[%w0123456789%.]") or s == " " then
            result = result .. s
        else
            result = result .. ""
        end
    end

    return result
end



function x.showLastStatus()
    utils.echo("coc status " .. '"' .. c .. '"')
end

require('lualine').setup {
    options = {
        refresh = {
            statusline = 250
        }
    },
    sections = {
        lualine_y = {'lsp_progress'},
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

return x
