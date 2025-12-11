return {
  'nvim-telescope/telescope.nvim',
  version = '0.2.0',

  dependencies = {
    'nvim-lua/plenary.nvim'
  },

  config = function()
    require("telescope").setup({
      defaults = {
        borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
      }
    })
  end
}
