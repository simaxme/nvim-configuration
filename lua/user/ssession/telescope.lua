local telescope = {}
local lib = require('user.ssession.lib')

-- telescope
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

function telescope.generateTelescopeWindow(opts)
    local sessions = lib.getAllSessions()

    opts = opts or {}

    pickers.new(opts, {
        prompt_title = "Sessions",
        finder = finders.new_table {
            results = sessions
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function (prompt_bufnr, map)
            actions.select_default:replace(function ()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()[1]
                lib.openSession(selection)
            end)
            return true
        end
    }):find()
end

vim.api.nvim_create_user_command(
    'SSessionOpen',
    function (args)
        telescope.generateTelescopeWindow(nil)
    end,
    {nargs = '*'}
)
vim.api.nvim_set_keymap("n", "fs", ":SSessionOpen<CR>", {noremap = true})


return telescope
