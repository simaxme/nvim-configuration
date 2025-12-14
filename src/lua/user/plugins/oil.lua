return {
  {
    'stevearc/oil.nvim',
    commit = 'cbcb3f997f6f261c577b943ec94e4ef55108dd95',

    opts = {
      float = {
        border = true,
        override = function(conf)
          conf.border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
          return conf
        end
      },
      view_options = {
        show_hidden = true
      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
