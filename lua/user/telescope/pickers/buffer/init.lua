local lib = require('user.telescope.lib')
local utils = require('user.utils')

local M = {}

local startupLib = require('user.startup.telescope')

function M.openSelect()
    local options = {
        {
            name = "[LSP] Format",
            action = vim.lsp.buf.formatting
        },
        {
            name = "[LSP] Rename Symbol",
            action = vim.lsp.buf.rename
        }
    }

    local startupOptions = startupLib.extractOptions()
    for _, name in ipairs(startupOptions) do
        table.insert(options, {
            name = name,
            action = function() startupLib.runSelection(name, true) end
        })
    end

    lib.start("NvimTreeActions", options)
end

vim.api.nvim_set_keymap("n", "<Leader>q", ":lua require('user.telescope.pickers.buffer.init').openSelect()<CR>",
    { noremap = true })

return M
