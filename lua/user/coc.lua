-- required (global) npm dependencies: prettier, prettier-plugin-java

function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col)) and true
end

-- transparent floating

vim.api.nvim_set_keymap("i", "<silent><expr>", "<c-space> coc#refresh", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-s>", "<Plug>(coc-definition)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-x>", "<Plug>(coc-references)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "rn", "<Plug>(coc-rename)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-c>", "<Plug>(coc-codeaction-selected)<CR>", {noremap = true})

vim.cmd [[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

]]

vim.g.coc_global_extensions = {
    'coc-json',
    'coc-java',
    'coc-snippets',
    'coc-css',
    'coc-html',
    'coc-tsserver',
    'coc-angular',
    'coc-lua',
    'coc-prettier'
}

vim.cmd [[command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument]]
