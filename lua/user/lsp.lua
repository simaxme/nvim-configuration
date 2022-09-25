-- lsp config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
        virtual_text = {
          spacing = 8,
        },
    }
)



require('lspconfig').tsserver.setup{}
require('lspconfig').sumneko_lua.setup{}
require('lspconfig').angularls.setup{}

