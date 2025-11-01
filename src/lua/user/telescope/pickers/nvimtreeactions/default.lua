local M = {}

function M.callback(key)
    return function()
        vim.cmd("normal " .. key)
    end
end

return M
