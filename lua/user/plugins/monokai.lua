function setup()
  require("monokai-pro").setup()

  vim.cmd("colorscheme monokai-pro-spectrum")
end

return {
  "loctvl842/monokai-pro.nvim",
  config = setup
}
