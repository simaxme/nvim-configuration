vim.api.nvim_set_keymap("n", "<C-t>", [[
    :Gcd<CR>
    :belowright split<CR>
    :term<CR>
    :resize 8<CR>
    i
]], {noremap = true})

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
