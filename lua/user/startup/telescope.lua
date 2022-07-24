local telescope = {}

local telescopeOptions = {
    require('user.startup.scripts.commandline'),
    require('user.startup.scripts.npm')
}

local utils = require('user.utils')
local terminal = require('user.terminal')

-- telescope
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

function telescope.extractOptions()
    vim.cmd [[Gcd]]

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
                local command = telescopeOption.runOption(string.sub(selection, string.len(telescopeOption.prefix) + 1, string.len(selection)))
                if vertical then
                    terminal.createVerticalTerminal(command)
                else
                    terminal.createHorizontalTerminal(command)
                end
            end
        end
    else
        utils.echo("selection is empty")
    end
end

function telescope.generateTelescopeWindow(opts, vertical)
    local options = telescope.extractOptions()

    opts = opts or {}

    pickers.new(opts, {
        prompt_title = "Startup",
        finder = finders.new_table {
            results = options
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function (prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()[1]
                utils.echo("got selection: " .. selection)
                telescope.runSelection(selection, vertical)
            end)
            return true
        end
    }):find()
end

vim.api.nvim_create_user_command(
    'Start',
    function (args)
        telescope.generateTelescopeWindow(nil, true)
    end,
    {nargs = '*'}
)
vim.api.nvim_create_user_command(
    'VStart',
    function (args)
        telescope.generateTelescopeWindow(nil, true)
    end,
    {nargs = '*'}
)
vim.api.nvim_create_user_command(
    'HStart',
    function (args)
        telescope.generateTelescopeWindow(nil, false)
    end,
    {nargs = '*'}
)


return telescope
