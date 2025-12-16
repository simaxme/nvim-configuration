local M = {}

local lint = require("lint")

function M.run_eslint(bufnr)
  local filetype = vim.fn.getbufvar(bufnr, "&filetype")

  if filetype ~= 'typescript' and filetype ~= 'javascript' and filetype ~= 'scss' and filetype ~= 'css' and filetype ~= 'html' then
    return
  end

  local start = "eslint.config"
  local root_folder = vim.fs.root(bufnr, function(name, _)
    return name:sub(1, #start) == start
  end)

  if root_folder == nil then
    return
  end

  local binary = root_folder .. "/node_modules/.bin/eslint"

  if vim.fn.filereadable(binary) == 0 then
    vim.notify("ESLint binary not readbable/found!")
    return
  end

  local filepath = vim.api.nvim_buf_get_name(bufnr)
  local cwd = vim.fn.fnamemodify(filepath, ":h")

  lint.linters.eslint.cmd = "bash"
  lint.linters.eslint.args = {
    "-c",
    "cd '" .. cwd .. "' && '" .. binary .. "' --format json --stdin --stdin-filename '" .. filepath .. "'"
  }

  require('lint').try_lint("eslint")
end

return M
