-- lsp config
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true
  })


local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function on_attach(client, bufnr)
end

vim.lsp.config("*", {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.config("cssls", {
  on_attach = on_attach, filetypes = { "css", "scss" }, capabilities = capabilities
})
vim.lsp.config("html", { on_attach = on_attach, capabilities = capabilities, filetypes = { "html", "angular.html" } })
vim.lsp.config("ts_ls", {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative"
    }
  }
})

vim.lsp.enable({
  "ts_ls",
  "lua_ls",
  "jsonls",
  "cssls",
  "html",
  "phpactor",
  "rust_analyzer",
  "angularls",
  "pyright"
})
