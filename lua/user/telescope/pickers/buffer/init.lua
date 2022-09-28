local lib = require('user.telescope.lib')
local utils = require('user.utils')

local M = {}

function M.openSelect()
    lib.start("NvimTreeActions", {
        {
            name = "Run",
            action = function() require('user.startup.telescope').generateTelescopeWindow(nil, true) end
        },
        {
            name = "[LSP] Format",
            action = vim.lsp.buf.formatting
        },
        {
            name = "[LSP] Rename Symbol",
            action = vim.lsp.buf.rename
        }
    })
end

vim.api.nvim_set_keymap("n", "<Leader>q", ":lua require('user.telescope.pickers.buffer.init').openSelect()<CR>", {noremap = true})

return M
