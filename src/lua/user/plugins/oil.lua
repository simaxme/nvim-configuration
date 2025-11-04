local function setup()
  require("oil").setup({
    float = {
      border = true,
      override = function(conf)
        conf.border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
        return conf
      end
    }
  })
end

return {
  'stevearc/oil.nvim',
  opts = {},
  config = setup,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
