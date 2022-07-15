vim.g.NERDSpaceDelims = 1
vim.api.nvim_set_keymap("n", "<Leader><Tab>", [[
    ^:call nerdcommenter#Comment('n', 'Toggle')
]], {noremap = true})
vim.api.nvim_set_keymap("v", "<Leader><Tab>", [[
    :call nerdcommenter#Comment('x', 'Toggle')
]], {noremap = true})
