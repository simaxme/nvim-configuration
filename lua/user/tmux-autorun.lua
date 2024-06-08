local tmux = require("user.tmux")

local config

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
  end

  config = data
end

vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    handle_dir()
  end
})


vim.api.nvim_create_autocmd("ExitPre", {
  callback = function()
    if config == nil then return end

    for key, value in pairs(config) do
      local name = "autorun-" .. key

      if tmux.windowExistsByName(name) then
        tmux.killWindow(name)
      end
    end
  end
})
