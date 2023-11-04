local tmux = {}

function tmux.isTmux()
    return os.getenv("TERM_PROGRAM") == "tmux"
end

function tmux.getWindowName()
    local handle = io.popen("tmux display-message -p '#W'")
    if (handle == nil) then return nil end
    handle:flush()
    local content = handle:read("*a")
    handle:close()
    return string.gsub(content, "[\n\r]", "")
end

local oldWindowName = tmux.getWindowName()

function tmux.getSessionName()
    local handle = io.popen("tmux display-message -p '#S'")
    if (handle == nil) then return nil end
    handle:flush()
    local content = handle:read("*a")
    handle:close()
    return string.gsub(content, "[\n\r]", "")
end

function tmux.windowExists(id)
    local sessionName = tmux.getSessionName()
    local handle = io.popen("tmux has-session -t " .. sessionName .. ":" .. id .. " &> /dev/null; echo $?")
    if (handle == nil) then return nil end
    handle:flush()
    local content = handle:read("*a")
    handle:close();
    return string.gsub(content, "[\n\r]", "") == "0"
end

function tmux.renameWindow(name)
    local handle = io.popen("tmux rename-window '" .. name .. "'")
    if (handle == nil) then return nil end
    handle:flush()
    handle:close()
end

function tmux.killWindow(id)
    local handle = io.popen("tmux kill-window -t " .. id)
    if (handle == nil) then return nil end
    handle:flush()
    handle:close()
end

function tmux.selectWindow(id)
    local handle = io.popen("tmux select-window -t " .. id)
    if (handle == nil) then return nil end
    handle:flush()
    handle:close()
end


function tmux.createWindow(name, directory, id, shellCommand)
    local command = "tmux new-window -P -F '#I'"

    if name ~= nil then command = command .. " -n '" .. name .. "'" end
    if id ~= nil then command = command .. " -t " .. id end
    if directory ~= nil then command = command .. " -c " .. directory end
    if shellCommand ~= nill then command = command .. " '" .. shellCommand .. "'" end

    local handle = io.popen(command)
    if (handle == nil) then return nil end
    handle:flush()
    local content = string.gsub(handle:read("*a"), "[\n\r]", "")
    handle:close()

    return content
end

function tmux.createSession(shellCommand)
    io.popen("tmux new-session '" .. shellCommand .. "'")
end

local function autoRenameWindow()
    local folderName = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    tmux.renameWindow("nvim - " .. folderName)
end

if tmux.isTmux() then
    autoRenameWindow()

    local id = nil

    vim.api.nvim_create_autocmd("DirChanged", {
        callback = function ()
            autoRenameWindow()
            id = nil
        end
    })
    vim.api.nvim_create_autocmd("ExitPre", {
        callback = function ()
            tmux.renameWindow(oldWindowName)
        end
    })

    vim.keymap.set("n", "<Leader>t", function ()
        if id ~= nil and tmux.windowExists(id) then
            tmux.selectWindow(id)
        else
            local folderName = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

            local message = "---- Terminal for " .. folderName .. " -----"

            id = tmux.createWindow(folderName .. " terminal", vim.fn.getcwd(), nil, "echo \"" .. message .. "\" && zsh")
        end

    end, { noremap = true })
else
end

return tmux
