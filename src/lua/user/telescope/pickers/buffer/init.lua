local lib = require('user.telescope.lib')
local utils = require('user.utils')

local M = {}

-- local startupLib = require('user.startup.telescope')

function M.openSelect()
    local options = {
        {
            name = "[LSP] Format",
            action = function() vim.lsp.buf.format({ async = false }) end
        },
        {
            name = "[LSP] Rename Symbol",
            action = vim.lsp.buf.rename
        },
        {
            name = "[LSP] Symbols",
            action = function() vim.cmd("SymbolsOutline") end
        },
        {
            name = "[LSP] Show Error",
            action = function() vim.diagnostic.open_float() end
        }
    }

    lib.start("NvimTreeActions", options)
end

return M
