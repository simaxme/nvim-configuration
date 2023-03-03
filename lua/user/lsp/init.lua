require('user.lsp.rename')

-- lsp config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR
    }
})


-- I am writing annn text
local git = require('user.git')

-- vim.api.nvim_create_autocmd({ 'BufWritePre' }, { callback = function() formatLspWithoutError() end })
vim.api.nvim_create_autocmd({ 'BufRead' }, { callback = function() git.navigateToGitRoot() end })

local navic = require('nvim-navic')
navic.setup {
    highlight = true
}
local function onAttach(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        vim.g.navic_silence = true
        navic.attach(client, bufnr)
        vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()


require('lspconfig').tsserver.setup { on_attach = onAttach }
require('lspconfig').lua_ls.setup { on_attach = onAttach }
require('lspconfig').angularls.setup { on_attach = onAttach }
require('lspconfig').html.setup { on_attach = onAttach }
require('lspconfig').jsonls.setup { on_attach = onAttach }
require('lspconfig').cssls.setup { on_attach = onAttach, filetypes = {"css", "scss"}, capabilities = capabilities }

require "fidget".setup { on_attach = onAttach }

local null_ls = require("null-ls")
null_ls.setup({
    -- sources = {
    --     null_ls.builtins.diagnostics.codespell
    -- }
})
