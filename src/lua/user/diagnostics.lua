-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function() git.navigateToGitRoot() end })
vim.diagnostic.config {
  float = { border = "rounded" },
  virtual_text = true
}

-- currently bugged, will be fixed in some time (https://github.com/neovim/neovim/pull/20198)
local cmp = require("cmp")
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    if cmp.visible() then
      return
    end
    vim.diagnostic.open_float({ focusable = false })
  end
})
