function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col)) and true
end

vim.api.nvim_set_keymap("i", "<silent><expr>", "<c-space> coc#refresh", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-s>", ":call CocAction('jumpDefinition')<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "rn", "<Plug>(coc-rename)", {noremap = true})

vim.cmd [[
    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<CR>" :
          \ v:lua.check_back_space() ? "\<Tab>" :
          \ coc#refresh()
]]
