local jvmDirectory = "/usr/lib/jvm"

local M = {}

local utils = require('user.utils')
local scan = require 'plenary.scandir'
local sessionLib = require('user.ssession.lib')

local home = os.getenv("HOME")

function M.getJavaVersions()
    local arr = scan.scan_dir(jvmDirectory, { hidden = true, depth = 0, only_dirs = true });

    local versions = {}

    for i = 1, #arr do
        local obj = arr[i]

        local splitted = utils.split(obj, jvmDirectory)[1]

        table.insert(versions, splitted)
    end

    return versions
end

local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

function M.chooseJavaVersion(opts)
    pickers.new(opts or {}, {
        prompt_title = "Sessions",
        finder = finders.new_table {
            results = M.getJavaVersions()
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()[1]
                M.selectJavaVersion(selection)
            end)
            return true
        end
    }):find()

end

function M.selectJavaVersion(version)
    local path = jvmDirectory .. version

    local config = home .. "/dev/java/" .. sessionLib.getCurrentCWDId() .. ".txt"

    os.execute("mkdir -p " .. home .. "/dev/nvim/java/")

    local file = io.open(config, "w")
    io.output(file)
    io.write(path)
    io.close(file)

    utils.echo("Java Version set to " .. path)

    vim.cmd [[qa]]
end

M.javaVersion = nil
function M.findJavaVersion()
    local config = home .. "/dev/nvim/java/" .. sessionLib.getCurrentCWDId() .. ".txt"

    local file = io.open(config, "r") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()

    M.javaVersion = utils.split(content, jvmDirectory)[1]

    return content
end

vim.api.nvim_create_user_command(
    'JavaVersion',
    function(args)
        M.chooseJavaVersion()
    end,
    { nargs = '*' }
)

return M
