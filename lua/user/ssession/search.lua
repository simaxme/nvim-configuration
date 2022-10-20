local search = {}

local home = os.getenv("HOME")
local folder = home .. "/projects"
local scan = require 'plenary.scandir'

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

return search
