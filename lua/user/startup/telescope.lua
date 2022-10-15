local telescope = {}

local telescopeOptions = {
    require('user.startup.scripts.commandline'),
    require('user.startup.scripts.npm')
}

local utils = require('user.utils')
local terminal = require('user.toggleterm')

-- telescope
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local git = require "user.git"

function telescope.extractOptions()
    git.navigateToGitRoot()

    local result = {}
    for index = 1, #telescopeOptions do
        local telescopeOption = telescopeOptions[index]
        local prefix = telescopeOption.prefix
        local options = telescopeOption.getOptions()

        -- add prefix
        for i = 1, #options do
            utils.echo("got option: " .. prefix .. options[i])
            table.insert(result, prefix .. options[i])
        end
    end
    return result
end

function telescope.runSelection(selection, vertical)
    if selection ~= nil then
        for index = 1, #telescopeOptions do
            local telescopeOption = telescopeOptions[index]
            if utils.stringStartsWith(selection, telescopeOption.prefix) then
                local command = telescopeOption.runOption(string.sub(selection, string.len(telescopeOption.prefix) + 1,
                    string.len(selection)))
                terminal.runCommand(command)
            end
        end
    else
        utils.echo("selection is empty")
    end
end

return telescope
