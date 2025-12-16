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

vim.lsp.config("*", {
  on_attach = on_attach,
  capabilities = capabilities
})
vim.lsp.config("cssls", {
  on_attach = on_attach, filetypes = { "css", "scss" }, capabilities = capabilities
})
vim.lsp.config("html", { on_attach = on_attach, capabilities = capabilities, filetypes = { "html", "angular.html" } })

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

local function any_client_has_formatting()
  local clients = vim.lsp.get_clients({
    method = "textDocument/formatting",
    bufnr = 0
  })
  return #clients ~= 0
end

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(information)
    local bufnr = information.buf
    local filetype = vim.fn.getbufvar(bufnr, "&filetype")
    if filetype == "java" or filetype == "typescript" or filetype == "html" or filetype == "css" or filetype == "scss" then
      return
    end

    if not any_client_has_formatting() then
      return
    end
    vim.lsp.buf.format()
  end,
})
