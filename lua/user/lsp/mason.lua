require("mason").setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    "angularls",
    "jdtls",
    "jsonls",
    "cssls",
    "tailwindcss",
    "html",
    "phpactor"
  }
})
