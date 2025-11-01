
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


require('lspconfig').tsserver.setup { on_attach = on_attach }
require('lspconfig').lua_ls.setup { on_attach = on_attach }
require("lspconfig").tailwindcss.setup { on_attach = on_attach, capabilities = capabilities, filetypes = { "html", "angular.html" } }
require('lspconfig').jsonls.setup { on_attach = on_attach }
require('lspconfig').cssls.setup { on_attach = on_attach, filetypes = { "css", "scss" }, capabilities = capabilities }
require("lspconfig").html.setup { on_attach = on_attach, capabilities = capabilities, filetypes = { "html", "angular.html" } }
require("lspconfig").phpactor.setup { on_attach = on_attach, capabilities = capabilities }
require("lspconfig").rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }

-- angularls fix
local ok, mason_registry = pcall(require, 'mason-registry')
if not ok then
  vim.notify 'mason-registry could not be loaded'
  return
end

local angularls_path =
    mason_registry.get_package('angular-language-server'):get_install_path()

local cmd = {
  'ngserver',
  '--stdio',
  '--tsProbeLocations',
  table.concat({
    angularls_path,
    vim.uv.cwd(),
  }, ','),
  '--ngProbeLocations',
  table.concat({
    angularls_path .. '/node_modules/@angular/language-server',
    vim.uv.cwd(),
  }, ','),
}

local angularConfig = {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
  on_attach = on_attach,
  capabilities = capabilities,
  -- filetypes = { "angular.html" }
}

require('lspconfig').angularls.setup(angularConfig)

require "fidget".setup { on_attach = on_attach }

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
