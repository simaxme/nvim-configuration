local function get_current_tabs()
  return vim.opt.tabstop:get() .. " spaces"
end

return {
  'nvim-lualine/lualine.nvim',

  config = function()
    require('lualine').setup {
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
  end
}
