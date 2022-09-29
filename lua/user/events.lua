vim.cmd [[
    autocmd VimEnter * :silent! Gcd
]]

-- currently bugged, will be fixed in some time (https://github.com/neovim/neovim/pull/20198)
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { callback = function() vim.diagnostic.open_float() end })



vim.notify = require('notify')
