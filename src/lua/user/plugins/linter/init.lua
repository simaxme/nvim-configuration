local function setup()
  vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
    callback = function(information)
      require('user.plugins.linter.eslint').run_eslint(information)
    end
  })
end

return {
  "mfussenegger/nvim-lint",
  commit = "897f7771c1ca4b11659dfe372d9376acd9fe3097",
  config = setup
}
