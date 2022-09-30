local commandline = {}

commandline.prefix = "[BASH] "

local utils = require('user.utils')
local scan = require'plenary.scandir'

function commandline.getOptions()
    local options = {}

    local arr = scan.scan_dir('.', { hidden = true, depth = 0 });
    for index = 1, #arr do
        local opt = arr[index]
        if utils.stringEndsWithWith(opt, ".sh") or utils.stringEndsWithWith(opt, ".bash") then
            table.insert(options, opt)
        end
    end

    return options
end
function commandline.runOption(option)
    utils.echo("got option to run: " .. option)
    return "bash " .. option
end

return commandline
