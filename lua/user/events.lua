vim.cmd [[
    autocmd VimEnter * :silent! Gcd
]]

vim.diagnostic.config {
    float = { border = "rounded" },
}

-- currently bugged, will be fixed in some time (https://github.com/neovim/neovim/pull/20198)
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' },
    { callback = function() vim.diagnostic.open_float({ focusable = false }) end })



vim.notify = require('notify')
