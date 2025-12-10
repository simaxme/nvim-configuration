local home = vim.fn.expand("$HOME")
vim.lsp.config("jdtls", {
  cmd = {
    "bash",
    home .. '/.config/nvim/scripts/java-lsp.bash'
  }
})

vim.lsp.enable("jdtls")
