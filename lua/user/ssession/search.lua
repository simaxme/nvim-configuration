local search = {}

local home = os.getenv("HOME")
local folder = home .. "/projects"
local scan = require 'plenary.scandir'

local telescopeLib = require('user.telescope.lib')

local function exists(file)
    local f = io.open(file)
    return f and io.close(f)
end

function search.search()
    os.execute("mkdir -p " .. folder)

    local arr = scan.scan_dir(folder, { hidden = true, only_dirs = true });

    local result = {}

    for _, elem in ipairs(arr) do
        if exists(elem .. "/.git") then
            table.insert(result, elem)
        end
    end

    return result
end

function search.telescope()
    local options = search.search()

    local result = {}

    for i = 1, #options do
        local opt = options[i]
        table.insert(result, {
            name = opt,
            action = function () vim.cmd("edit " .. opt) end
        })
    end

    telescopeLib.start("Search Project", result)
end

vim.api.nvim_create_user_command(
    'SSessionProjectOpen',
    function(args)
        search.telescope()
    end,
    { nargs = '*' }
)

return search
