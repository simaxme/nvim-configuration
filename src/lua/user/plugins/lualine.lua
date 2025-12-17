local function get_current_tabs()
  return vim.opt.tabstop:get() .. " spaces"
end

local function get_available_formatters()
  local formatters = require("conform").list_formatters(0)
  local names = {}
  for _, v in ipairs(formatters) do
    table.insert(names, v.name)
  end
  return table.concat(names, " ")
end

return {
  {
    "nvim-lualine/lualine.nvim",
    commit = "47f91c416daef12db467145e16bed5bbfe00add8",

    opts = {
      options = {
        refresh = {
          statusline = 5000
        },
        theme = "catppuccin"
      },
      sections = {
        lualine_x = { get_current_tabs, "encoding", "fileformat", "filetype" },
        lualine_y = { get_available_formatters, "lsp_status" },
        lualine_z = { "progress", "location" }
      }
    }
  }
}
