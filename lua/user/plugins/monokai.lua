function setup()
  require("monokai-pro").setup({
    background_clear = { "float_win" }
  })

  vim.cmd("colorscheme monokai-pro-spectrum")
end

return {
  "loctvl842/monokai-pro.nvim",
  config = setup
}
