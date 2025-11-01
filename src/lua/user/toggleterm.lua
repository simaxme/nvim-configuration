require('toggleterm').setup({
    size = 15
})

local Terminal = require('toggleterm.terminal').Terminal

local toggleterm = {}

function toggleterm.runCommand(command)
    Terminal:new({ cmd = command }):toggle()
end

vim.api.nvim_create_user_command(
    'GitGui',
    function(args)
        Terminal:new({ cmd = "gitui", direction = "float" }):toggle()
    end,
    { nargs = '*' }
)

return toggleterm
