local function setup()
  require("oil").setup({})
end

return {
  'stevearc/oil.nvim',
  opts = {},
  config = setup,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
