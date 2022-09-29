local terminal = {}
local utils = require('user.utils')

-- CONSTANTS
local HORIZONTAL_TERMINAL_SIZE_FULL = 15
local VERTICAL_TERMINAL_SIZE_FULL = 45
-- ----

vim.opt.shell = "/bin/bash"

function tryGCD()
    vim.cmd [[silent! Gcd]]
end

function createTerminal(command)
    tryGCD()
    if command ~= nil then
        vim.cmd ([[term ]] .. command)
    else
        vim.cmd [[term]]
    end
end
function terminal.createVerticalTerminal(command)
    vim.cmd [[belowright vsplit]]
    createTerminal(command)
    vim.cmd ([[vertical resize ]] .. VERTICAL_TERMINAL_SIZE_FULL)
end
function terminal.createHorizontalTerminal(command)
    vim.cmd [[belowright split]]
    createTerminal(command)
    vim.cmd ([[resize ]] .. HORIZONTAL_TERMINAL_SIZE_FULL)
end


vim.api.nvim_create_user_command(
    'VTerminal',
    function (args)
        terminal.createVerticalTerminal(nil)
    end,
    {nargs = '*'}
)
vim.api.nvim_create_user_command(
    'Terminal',
    function (args)
        terminal.createHorizontalTerminal(nil)
    end,
    {nargs = '*'}
)
vim.api.nvim_create_user_command(
    'HTerminal',
    function (args)
        terminal.createHorizontalTerminal(nil)
    end,
    {nargs = '*'}
)

vim.api.nvim_set_keymap("n", "<C-t>", ":lua require('user.terminal').createHorizontalTerminal()<CR>", {noremap = true})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
vim.api.nvim_set_keymap("t", "<C-w>", "<C-\\><C-n><C-w>", {noremap = true})

return terminal
