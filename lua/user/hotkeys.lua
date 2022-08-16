vim.api.nvim_set_keymap("", "<Space>", "<Leader>", {noremap = false})

-- tab selection
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", {noremap = false})
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", {noremap = false})

-- center only with one z
vim.api.nvim_set_keymap("n", "z", "zz", {noremap = true})
-- do not yank newline symbol
vim.api.nvim_set_keymap("n", "yy", "^vg_y", {noremap = true})

-- use ctrl + hjkl for navigation
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", {noremap = true})

vim.api.nvim_set_keymap("n", "d", '"_d', {noremap = true})
vim.api.nvim_set_keymap("v", "d", '"_d', {noremap = true})

-- tab current row in normal mode
vim.api.nvim_set_keymap("n", "<Tab>", "v>gv<ESC>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-Tab>", "v<gv<ESC>", {noremap = true})

-- close all tabs except current
vim.cmd [[command! X %bd|e#|bd#]]
