local lib = require('user.telescope.lib')
local utils = require('user.utils')

local M = {}

function M.openSelect()
    lib.start("NvimTreeActions", {
        {
            name = "Add File",
            action = require('user.telescope.pickers.nvimtreeactions.default').callback("a")
        },
        {
            name = "Rename File",
            action = require('user.telescope.pickers.nvimtreeactions.default').callback("r")
        },
        {
            name = "Copy File",
            action = require('user.telescope.pickers.nvimtreeactions.default').callback("c")
        },
        {
            name = "Remove File",
            action = require('user.telescope.pickers.nvimtreeactions.default').callback("d")
        },
        {
            name = "Angular",
            action = require('user.telescope.pickers.nvimtreeactions.angular').open
        }
    })
end

return M
