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
        lualine_y = { "lsp_status" },
        lualine_z = { 'progress', 'location' }
      }
    }
  end
}
