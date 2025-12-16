local function setup()
  local bufnr = nil

  vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    callback = function()
      bufnr = vim.api.nvim_get_current_buf()
      require('user.plugins.linter.eslint').run_eslint(bufnr)
    end
  })

  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    callback = function(information)
      if bufnr == nil then
        return
      end

      if information.buf ~= bufnr then
        return
      end

      require('user.plugins.linter.eslint').run_eslint(bufnr)
    end
  })
end

return {
  {
    "mfussenegger/nvim-lint",
    commit = "897f7771c1ca4b11659dfe372d9376acd9fe3097",
    config = setup
  }
}
