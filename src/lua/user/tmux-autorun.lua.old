local tmux = require("user.tmux")

local toDelete = {}

if not tmux.isTmux() then
  return
end

local function handle_dir()
  local cwd = vim.fn.getcwd()

  local path = cwd .. "/.tmux-autorun.json"

  local file = io.open(path, "r")

  if file == nil then return end

  local content = file:read("*a")

  file:close()

  local data = vim.json.decode(content)

  for key, value in pairs(data) do
    local name = "autorun-" .. key

    if tmux.windowExistsByName(name) then
    else
      local command = "bash -c \"" .. value .. " || true; while true; do sleep 86400; done\""
      tmux.createWindow(name, cwd, nil, command)
      tmux.lastWindow()
    end

    toDelete[key] = value
  end

  config = data
end

vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    handle_dir()
  end
})

local function destroySession()
  for key, value in pairs(toDelete) do
    local name = "autorun-" .. key

    if tmux.windowExistsByName(name) then
      tmux.killWindow(name)
    end
  end
  toDelete = {}
end


vim.api.nvim_create_autocmd("ExitPre", {
  callback = function()
    destroySession()
  end
})

local function restart()
  destroySession()
  handle_dir()
end

vim.api.nvim_create_user_command("AutorunStart", function()
  restart()
end, {})
vim.api.nvim_create_user_command("AutorunRestart", function()
  restart()
end, {})
vim.api.nvim_create_user_command("AutorunStop", function()
  destroySession()
end, {})
