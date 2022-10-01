require('user.lsp.prettier')

-- lsp config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
    virtual_text = {
        spacing = 8,
    },
}
)

vim.api.nvim_create_autocmd({ 'BufWritePre' }, { callback = vim.lsp.buf.formatting_sync })
vim.api.nvim_create_autocmd({ 'BufRead' }, { callback = function() vim.cmd("silent! Gcd") end })

require('lspconfig').tsserver.setup {}
require('lspconfig').sumneko_lua.setup {}
require('lspconfig').angularls.setup {}

require "fidget".setup {}
