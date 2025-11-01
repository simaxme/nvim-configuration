local utils = {}

-- split a string
function utils.split(search_string, pattern)
  local result = {}
  local end_index = 1
  local start_index = 1

  while end_index ~= nil do
    start_index, end_index = string.find(search_string, pattern, 1, true)

    if start_index ~= nil and end_index ~= nil then
      table.insert(result, string.sub(search_string, 1, start_index - 1))
      search_string = string.sub(search_string, end_index + 1, #search_string)
    end
  end

  table.insert(result, search_string)

  return result
end

function utils.echo(str)
  vim.cmd([[echo ']] .. str .. [[']])
end

function utils.error(str)
  vim.cmd([[echoerr ']] .. str .. [[']])
end

function utils.getCWD()
  return vim.api.nvim_eval("getcwd()")
end

function utils.fileExists(path)
  local f = io.open(path, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function utils.stringStartsWith(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

function utils.stringEndsWithWith(String, End)
  return string.sub(String, string.len(String) - string.len(End) + 1, string.len(String)) == End
end

function utils.isDir(path)
    local f = io.open(path, "r")
    local _, _, code = f:read(1)
    f:close()
    return code == 21
end

return utils
