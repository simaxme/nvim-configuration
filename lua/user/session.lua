x = {}

require('telescope').load_extension('session-lens')
require('auto-session').setup {
    auto_save_enabled = false,
    auto_restore_enabled = false
}
require('session-lens').setup {
    path_display={'shorten'},
}

vim.cmd [[
    set sessionoptions=buffers
]]

function x.searchSessionIfNoFileExists()
    if (vim.fn.argc() == 0) then
        vim.cmd [[Telescope session-lens search_session]]
    end
end

vim.cmd [[
    autocmd SessionLoadPost * :silent! Gcd
    autocmd VimEnter * lua require('user.session').searchSessionIfNoFileExists()
    autocmd VimLeave * SaveSess
]]

return x
