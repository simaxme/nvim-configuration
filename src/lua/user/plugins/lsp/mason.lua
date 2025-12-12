require("mason").setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    "angularls",
    "jdtls",
    "jsonls",
    "cssls",
    "html",
    "phpactor",
    "rust_analyzer",
    "lua_ls",
    "pyright",
    "ts_ls"
  },
  automatic_enable = false
})
