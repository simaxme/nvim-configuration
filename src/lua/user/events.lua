local git = require('user.git');

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = function() git.navigateToGitRoot() end })

vim.diagnostic.config {
    float = { border = "rounded" },
}

-- currently bugged, will be fixed in some time (https://github.com/neovim/neovim/pull/20198)
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' },
    { callback = function() vim.diagnostic.open_float({ focusable = false }) end })



vim.notify = require('notify');
vim.notify.setup {
    background_colour = "#00000000"
}
