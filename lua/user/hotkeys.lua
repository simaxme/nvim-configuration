vim.api.nvim_set_keymap("", "<Space>", "<Leader>", { noremap = false })

-- tab selection
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = false })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = false })

-- center only with one z
-- vim.api.nvim_set_keymap("n", "z", "zz", {noremap = true})
-- do not yank newline symbol
vim.api.nvim_set_keymap("n", "yy", "mm^vg_y`m", { noremap = true })

-- use ctrl + hjkl for navigation
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true })

-- tab current row in normal mode
vim.api.nvim_set_keymap("n", "<Tab>", "v>gv<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "v<gv<ESC>", { noremap = true })

-- standard custom made options menu
vim.api.nvim_set_keymap("n", "<Leader>q", ":lua require('user.telescope.pickers.buffer.init').openSelect()<CR>",
    { noremap = true })

-- terminal stuff
vim.api.nvim_set_keymap("n", "<C-t>", ":lua require('user.terminal').createHorizontalTerminal()<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-w>", "<C-\\><C-n><C-w>", { noremap = true })

-- nvimtree
vim.api.nvim_set_keymap("", "<S-e>", ":lua require('user.nvimtree').findFile()<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<C-e>", ":lua require('user.nvimtree').toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "x<CR>", ":bn|bd#<CR>", { noremap = true })

-- symbols summary
vim.api.nvim_set_keymap("n", "<Leader>s", ":SymbolsOutline<CR>", { noremap = true })

-- smooth scrolling
vim.api.nvim_set_keymap("", "<S-Up>", ":lua require('neoscroll').scroll(-50, true, 100)<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<S-Down>", ":lua require('neoscroll').scroll(50, true, 100)<CR>", { noremap = true })

-- LSP Config
vim.api.nvim_set_keymap("n", "<C-s>", ":lua vim.lsp.buf.definition()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-c>", ":Telescope lsp_references<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- Commenting
vim.api.nvim_set_keymap("n", "<Leader><Tab>", "gcc", { noremap = false })

-- close all tabs except current
vim.cmd [[command! X %bd|e#|bd#]]
