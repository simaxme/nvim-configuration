local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local utils = require('user.utils')

local M = {}

function M.start(title, data)
    local options = {}
    for _, val in ipairs(data) do
        table.insert(options, val.name)
    end

    pickers.new({}, {
        prompt_title = title,
        finder = finders.new_table {
            results = options
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()[1]
                for _, val in ipairs(data) do
                    if val.name == selection then
                        val.action()
                    end
                end
            end)
            return true
        end
    }):find()

end

function M.findBuffer()
    local dropdown = require('telescope.themes').get_dropdown({
        previewer = false
    })

    require('telescope.builtin').buffers(dropdown)
end

return M
