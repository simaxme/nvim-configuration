return {
  -- auto completion
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-jdtls",
  },

  config = function()
    require('user.plugins.lsp.mason')
    require('user.plugins.lsp.servers')
    require('user.plugins.lsp.java')
  end
}
