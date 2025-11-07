local git = {}

local utils = require "user.utils"

local function exists(file)
  local f = io.open(file)
  return f and io.close(f)
end

function git.gitcheck(dir)
  -- For instance, this is required for buffers that are not real buffers, e. g. "oil:...."
  if string.find(dir, ":") ~= nil then
    return false
  end

  while #dir > 0 and not exists(dir .. "/.git") do
    dir = dir:gsub("/+[^/]*$", "")
  end
  return #dir > 0 and dir
end

function git.isGitDirectory()
  return git.gitcheck(vim.fn.expand("%:p:h"));
end

function git.navigateToGitRoot()
  print("Navigate to git root!")
  local isGitRepo = git.gitcheck(vim.fn.expand("%:p:h"));

  if isGitRepo then
    vim.cmd("cd " .. isGitRepo)
  end
end

vim.api.nvim_create_autocmd({ 'BufEnter' }, { callback = function() git.navigateToGitRoot() end })

return git
