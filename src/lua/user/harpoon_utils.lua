local M = {}

local harpoon = require("harpoon")

function M.get_cur_buf_index()
  local length = harpoon:list():length()

  local cwd = vim.fn.getcwd()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local _, end_index = string.find(buf_name, cwd, nil, true)
  if end_index == nil then return nil end
  local buf_result_name = string.sub(buf_name, end_index + 2, buf_name:len())

  local result_index = nil

  for i = 1, length do
    local value = harpoon:list():get(i).value

    if value == buf_result_name then
      result_index = i
    end
  end

  return result_index
end

return M
