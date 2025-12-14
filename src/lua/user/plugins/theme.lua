function setup()
  require("monokai-pro").setup({
    background_clear = { "float_win" }
  })

  -- vim.cmd("colorscheme monokai-pro-spectrum")
  vim.cmd("colorscheme monokai-pro-default")
end

return {
  {
    "loctvl842/monokai-pro.nvim",
    commit = "1ac671f6da720cba967d28d25c2f16b8b4e18808",
    config = setup
  }
}
