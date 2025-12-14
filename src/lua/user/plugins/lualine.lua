local function get_current_tabs()
  return vim.opt.tabstop:get() .. " spaces"
end

return {
  {
    'nvim-lualine/lualine.nvim',
    commit = "47f91c416daef12db467145e16bed5bbfe00add8",

    opts = {
      options = {
        refresh = {
          statusline = 5000
        },
        theme = "monokai-pro"
      },
      sections = {
        lualine_x = { get_current_tabs, 'encoding', 'fileformat', 'filetype' },
        lualine_y = { "lsp_status" },
        lualine_z = { 'progress', 'location' }
      }
    }
  }
}
