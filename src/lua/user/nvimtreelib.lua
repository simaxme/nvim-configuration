local M = {}

local api = require('nvim-tree.api')
function M.getCurrentNode()
    local data = api.tree.get_node_under_cursor()
    return data.absolute_path
end

local Path = require('plenary.path')
function M.getCurrentNodeFolder()
    local currentNode = M.getCurrentNode()
    local p = Path:new(currentNode)
    if p:is_file() then
        currentNode = Path:new(currentNode):parent():absolute()
    end
    return currentNode
end

return M
