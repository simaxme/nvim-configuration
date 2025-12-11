return {
  -- auto completion
  "neovim/nvim-lspconfig",
  commit = "a2bd1cf7b0446a7414aaf373cea5e4ca804c9c69",

  dependencies = {
    { "mason-org/mason.nvim",           version = "2.1.0" },
    { "mason-org/mason-lspconfig.nvim", version = "2.1.0" },
    { "mfussenegger/nvim-jdtls",        commit = "f73731b543f5971e0da9665eb1d7ceffe1fde71f" },
  },

  config = function()
    require('user.plugins.lsp.mason')
    require('user.plugins.lsp.servers')
    require('user.plugins.lsp.java')
    require('user.plugins.lsp.diagnostics')
  end
}
