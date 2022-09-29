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

    local startupOptions = startupLib.extractOptions()
    for _, name in ipairs(startupOptions) do
        table.insert(options, {
            name = name,
            action = function() startupLib.runSelection(name, true) end
        })
    end

    lib.start("NvimTreeActions", options)
end

return M
