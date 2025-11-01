local utils = require('user.utils')

local x = {}

local c = nil

local y = 0

local function escapeString(str)
  local result = ""
  for i = 1, string.len(str) do
    local s = string.sub(str, i, i)

    if s:match("[%w0123456789%.]") or s == " " then
      result = result .. s
    else
      result = result .. ""
    end
  end

  return result
end

function x.showLastStatus()
  utils.echo("coc status " .. '"' .. c .. '"')
end

local function getJavaVersion()
  return require('user.java').javaVersion or ""
end

local resultString = ""
local function loadLSPClients()
  local clients = vim.lsp.buf_get_clients(vim.api.nvim_get_current_buf())
  local names = {}

  for index = 1, #clients do
    if clients[index] ~= nil then
      table.insert(names, clients[index].name)
    end
  end

  resultString = table.concat(names, " ")
end

local function getLSPClients()
  loadLSPClients()
  return resultString
end



require('lualine').setup {
  options = {
    refresh = {
      statusline = 5000
    },
    theme = "monokai-pro"
  },
  sections = {
    lualine_y = { getJavaVersion, getLSPClients },
    lualine_z = { 'progress', 'location' }
  }
}

-- vim.opt.termguicolors = true
-- require("bufferline").setup {
--     options = {
--         diagnostics = "nvim_lsp",
--
--         diagnostics_indicator = function(count, level, diagnostics_dict, context)
--             if not level:match("error") then
--                 return ""
--             end
--
--             local icon = " "
--             return " " .. icon .. count
--         end,
--
--         offsets = {
--             {
--                 filetype = "NvimTree",
--                 text = "",
--                 highlight = "FolderTitle",
--                 text_align = "left",
--                 -- separator = true
--             }
--         }
--     }
-- }

vim.cmd [[
autocmd VimEnter * hi FolderTitle guifg=red
autocmd VimEnter * hi! link FolderTitle NvimTreeNormal
]]

-- autocmd VimEnter * hi FolderTitle guifg=red
return x
