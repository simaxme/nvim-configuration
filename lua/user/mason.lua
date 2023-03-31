require("mason").setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        "angularls",
        "jdtls",
        "html",
        "jsonls",
        "cssls"
    }
})
