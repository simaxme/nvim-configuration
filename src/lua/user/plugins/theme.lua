return {
  "catppuccin/nvim",

  config = function()
    require("catppuccin").setup({
      telescope = {
        enabled = true
      }
    })

    vim.cmd("colorscheme catppuccin-mocha")
  end
}
