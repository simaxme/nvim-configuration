return {
  "catppuccin/nvim",

  config = function()
    require("catppuccin").setup({
      integrations = {
        cmp = true,
        telescope = {
          enabled = true
        },
        gitsigns = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        notify = true,
        snacks = {
          enabled = false,
          indent_scope_color = "",
        }
      }
    })

    vim.cmd("colorscheme catppuccin-mocha")
  end
}
