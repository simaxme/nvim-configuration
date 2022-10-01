require('user.lsp.prettier')

-- lsp config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR
    }
}
)

vim.api.nvim_create_autocmd({ 'BufWritePre' }, { callback = function() vim.lsp.buf.format({ async = false }) end })
vim.api.nvim_create_autocmd({ 'BufRead' }, { callback = function() vim.cmd("silent! Gcd") end })

require('lspconfig').tsserver.setup {}
require('lspconfig').sumneko_lua.setup {}
require('lspconfig').angularls.setup {}

require "fidget".setup {}
