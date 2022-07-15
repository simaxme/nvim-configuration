vim.api.nvim_set_keymap("", "<Space>", "<Leader>", {noremap = false})

-- tab selection
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", {noremap = false})
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", {noremap = false})

-- center only with one z
vim.api.nvim_set_keymap("n", "z", "zz", {noremap = true})
-- do not yank newline symbol
vim.api.nvim_set_keymap("n", "yy", "^vg_y", {noremap = true})
