return {
  -- auto completion
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },

  config = function()
    require('user.plugins.lsp.mason')
    require('user.plugins.lsp.servers')
  end
}
