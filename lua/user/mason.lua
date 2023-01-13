require("mason").setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        "tsserver",
        "angularls",
        "jdtls",
        "html",
        "jsonls",
        "cssls"
    }
})
