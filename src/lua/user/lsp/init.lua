-- lsp config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
    virtual_text = {
      severity = vim.diagnostic.severity.ERROR
    }
  })


local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function on_attach(client, bufnr)
end

vim.lsp.config('*', {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.config('tailwindcss',
  { on_attach = on_attach, capabilities = capabilities, filetypes = { "html", "angular.html" } }
)
vim.lsp.config('cssls', {
  on_attach = on_attach, filetypes = { "css", "scss" }, capabilities = capabilities
})
vim.lsp.config('html', { on_attach = on_attach, capabilities = capabilities, filetypes = { "html", "angular.html" } })

vim.lsp.enable({
  'tsserver',
  'lua_ls',
  'tailwindcss',
  'jsonls',
  'cssls',
  'html',
  'phpactor',
  'rust_analyzer',
  'angularls',
  'pyright'
})

require "fidget".setup()

local function any_client_has_formatting()
  local clients = vim.lsp.get_clients({
    method = "textDocument/formatting",
    bufnr = 0
  })
  return #clients ~= 0
end

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    if not any_client_has_formatting() then
      return
    end
    vim.lsp.buf.format()
  end,
})
