local terminal = {}
local utils = require('user.utils')

-- CONSTANTS
local HORIZONTAL_TERMINAL_SIZE_FULL = 15
-- local HORIZONTAL_TERMINAL_SIZE_MIN = 4
-- local VERTICAL_TERMINAL_SIZE_MIN = 25
local VERTICAL_TERMINAL_SIZE_FULL = 45
-- ----

function getBuffName()
    return vim.fn.bufname()
end
function terminal.focusTerminalInput()
    -- focus current window after switching to terminal
    vim.cmd [[normal! i]]
end

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
    terminal.focusTerminalInput()
end
function terminal.createVerticalTerminal(command)
    vim.cmd [[belowright vsplit]]
    createTerminal(command)
    vim.cmd ([[vertical resize ]] .. VERTICAL_TERMINAL_SIZE_FULL)
    vim.cmd ([[file VE_]] .. getBuffName())
end
function terminal.createHorizontalTerminal(command)
    vim.cmd [[belowright split]]
    createTerminal(command)
    vim.cmd ([[resize ]] .. HORIZONTAL_TERMINAL_SIZE_FULL)
    vim.cmd ([[file HO_]] .. getBuffName())
end

function terminal.getCurrentBufferType()
    local bufid = vim.fn.bufnr()
    return vim.fn.getbufvar(bufid, '&buftype', 'ERROR')
end
function terminal.isCurrentBufferTerminal()
    return terminal.getCurrentBufferType() == "terminal"
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
