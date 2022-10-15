local git = {}

local utils = require "user.utils"

local function exists(file)
    local f = io.open(file)
    return f and io.close(f)
end

function git.gitcheck(dir)
    while #dir > 0 and not exists(dir .. "/.git") do
        dir = dir:gsub("/+[^/]*$", "")
    end
    return #dir > 0 and dir
end

function git.navigateToGitRoot()
    local isGitRepo = git.gitcheck(vim.fn.expand("%:p:h"));

    if isGitRepo then
        vim.cmd("cd " .. isGitRepo)
    end

end

return git
