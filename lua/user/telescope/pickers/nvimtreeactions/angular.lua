local M = {}

local schematics = {
    "app-shell",
    "application",
    "class",
    "component",
    "directive",
    "enum",
    "guard",
    "interceptor",
    "interface",
    "library",
    "module",
    "pipe",
    "resolver",
    "service",
    "service-worker",
    "web-worker"
}

local lib = require('user.telescope.lib')
local nvimTreeLib = require('user.nvimtreelib')
local utils = require('user.utils')
function M.createSchematic(path, schematic)
    return function()
        vim.ui.input(schematic .. " name: ", function(name)
            utils.echo("Creating " .. schematic .. " at " .. path .. "...")
            local exitCode = os.execute("cd " .. path .. " && " .. "ng g " .. schematic .. " " .. name .. " >/dev/null 2>&1")

            if exitCode == 0 then
                utils.echo("Created Component!")
            else
                utils.echo("Failed Component!")
            end
        end)
    end
end

local Path = require('plenary.path')
function M.open()
    local currentNode = nvimTreeLib.getCurrentNodeFolder()

    local options = {}

    for _, v in ipairs(schematics) do
        table.insert(options, {
            name = "Create " .. v,
            action = M.createSchematic(currentNode, v)
        })
    end

    lib.start("Angular Schematics", options)
end

return M
