require("mason").setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        "tsserver",
        "angularls",
        "jdtls",
        "html",
        "jsonls",
        -- "unocss"

        "cssls",
        -- "cssmodules_ls"
    }
})
