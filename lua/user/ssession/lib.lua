local lib = {}

local utils = require('user.utils')
local json = require('dependencies.jsonlua.json')
local git = require("user.git")

local SESSION_FOLDER = os.getenv('HOME') .. '/.local/share/nvim/sessions'

os.execute("mkdir -p " .. SESSION_FOLDER)

function lib.getAllBuffers()
    local buffers = vim.api.nvim_list_bufs()
    local resultBuffers = {}

    for index = 1, #buffers do
        local buffer = buffers[index]

        local filePath = vim.fn.expand('#' .. buffer .. ':p')

        local isListed = vim.fn.buflisted(buffer) == 1
        local isNotTerminal = vim.fn.getbufvar(buffer, "&buftype") ~= "terminal"

        if isListed and isNotTerminal then
            table.insert(resultBuffers, filePath)
        end
    end

    return resultBuffers
end

function lib.closeNoNameBuffers()
    local buffers = vim.api.nvim_list_bufs()

    for index = 1, #buffers do
        local buffer = buffers[index]

        local filePath = vim.fn.expand('#' .. buffer .. ':p')

        local isListed = vim.fn.buflisted(buffer) == 1

        if isListed and filePath == '' then
            vim.cmd([[bd]] .. buffer)
        end
    end
end

function lib.get_file_last_edit_date(path)
    return io.popen("stat -c %Y " .. path):read()
end

local scan = require 'plenary.scandir'
function lib.getAllSessions()
    local arr = scan.scan_dir(SESSION_FOLDER, { hidden = true, depth = 0 });

    table.sort(arr, function(a, b)
        return lib.get_file_last_edit_date(a) > lib.get_file_last_edit_date(b)
    end)

    local result = {}

    for i = 1, #arr do
        local obj = arr[i]
        if utils.stringEndsWithWith(obj, ".json") then
            local fileNameSplits = utils.split(obj, '/')
            local fileName1 = fileNameSplits[#fileNameSplits]
            local fileExtensionSplits = utils.split(fileName1, "%.")
            local withoutFileExtension = fileExtensionSplits[#fileExtensionSplits - 1]

            local file = io.open(SESSION_FOLDER .. "/" .. withoutFileExtension .. ".json", "r") -- r read mode and b binary mode

            if file ~= nil then

                local content = file:read "*a" -- *a or *all reads the whole file
                file:close()

                local jsonContent = json.decode(content)

                local buffers = jsonContent["buffers"]

                if withoutFileExtension ~= nil and buffers ~= nil then
                    table.insert(result, withoutFileExtension .. " # " .. #buffers)
                end

            end
        end
    end

    return result
end

function lib.getLastSessions()
    local sessions = lib.getAllSessions()

    if #sessions <= 5 then
        return sessions
    else
        return { sessions[1], sessions[2], sessions[3], sessions[4], sessions[5] }
    end
end

-- get the current working directory and return the id (will only be the folder name)
function lib.isGitDirectory()
    local data = git.gitcheck(vim.fn.expand("%:p:h"))
    local isDirectory = not not data

    return isDirectory
end

local git = require("user.git")

function lib.getCurrentCWDId()
    -- go into main directory

    local cwd = "unknown"

    if lib.isGitDirectory() then
        git.navigateToGitRoot()

        cwd = vim.fn.getcwd()
    else
        cwd = vim.fn.expand("%:p:h")
    end


    local fileNameSplits = utils.split(cwd, '/')
    local fileName1 = fileNameSplits[#fileNameSplits]

    return fileName1
end

function lib.createSession()
    local buffers = lib.getAllBuffers()

    if #buffers == 0 then
        return
    end

    local completeJSON = {}

    local isListed = vim.fn.buflisted(vim.fn.expand("%")) == 1

    if isListed then
        completeJSON["focused"] = vim.fn.expand("%:p")
    end

    completeJSON["cwd"] = vim.fn.getcwd()

    completeJSON["buffers"] = buffers

    local cwdID = lib.getCurrentCWDId()

    local filePath = SESSION_FOLDER .. "/" .. cwdID .. ".json"

    local file = io.open(filePath, "w")
    io.output(file)
    io.write(json.encode(completeJSON))
    io.close(file)
end

lib.loadedSession = false

function lib.openSession(name)
    if lib.loadedSesssion then
        lib.createSession()
    end

    lib.loadedSession = true

    local namesSplitted = utils.split(name, " # ");
    local resName = namesSplitted[1];

    local file = io.open(SESSION_FOLDER .. "/" .. resName .. ".json", "r") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()

    local jsonContent = json.decode(content)

    local cwd = jsonContent["cwd"]
    if cwd then
        vim.cmd("cd " .. jsonContent["cwd"])
    end

    local buffers = jsonContent["buffers"]
    local focused = jsonContent["focused"]

    vim.cmd [[bufdo bd]]

    for index = 1, #buffers do
        vim.cmd([[silent! edit ]] .. buffers[index])
    end

    if focused ~= nil then
        vim.cmd([[silent! edit ]] .. focused)
    end

    lib.closeNoNameBuffers()
end

vim.api.nvim_create_user_command(
    'SSessionSave',
    function(args)
        lib.createSession()
    end,
    { nargs = '*' }
)

-- save on close
vim.cmd [[autocmd VimLeave * SSessionSave]]

return lib
