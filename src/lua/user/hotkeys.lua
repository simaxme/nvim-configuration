vim.api.nvim_set_keymap("", "<Space>", "<Leader>", { noremap = false })

-- tab selection
vim.keymap.set("v", "<Tab>", ">gv", { noremap = false })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = false })

-- center only with one z
-- vim.api.nvim_set_keymap("n", "z", "zz", {noremap = true})
-- do not yank newline symbol
-- vim.keymap.set("n", "yy", "mm^vg_y`m", { noremap = true })

-- use ctrl + hjkl for navigation
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })

-- tab current row in normal mode
vim.keymap.set("n", "<Tab>", "v>gv<ESC>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "v<gv<ESC>", { noremap = true })

-- standard custom made options menu
vim.keymap.set("n", "<Leader>q", require('user.telescope.pickers.buffer.init').openSelect,
  { noremap = true })

-- oil.nvim
vim.keymap.set("", "<S-e>", function() require('oil').open_float(nil) end, { noremap = true })
vim.keymap.set("", "<C-e>", function() require('oil').open_float(vim.fn.getcwd()) end, { noremap = true })

vim.keymap.set("", "<Leader>x", ":bp|bd#<CR>", { noremap = true })

-- symbols summary
vim.keymap.set("n", "<Leader>s", ":SymbolsOutline<CR>", { noremap = true })

-- LSP Config
vim.keymap.set("n", "<C-s>", function() vim.lsp.buf.definition() end, { noremap = true })
vim.keymap.set("n", "<C-c>", ":Telescope lsp_references<CR>", { noremap = true })
vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, { noremap = true })
-- vim.keymap.set("n", "rn", require("java.rename.lsp").rename_symbol_wrapper, { noremap = true })
vim.keymap.set("n", "<Leader>w", function() vim.lsp.buf.code_action() end, {})

-- Commenting
vim.api.nvim_set_keymap("n", "<Leader><Tab>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<Leader><Tab>", "gcc", { noremap = false })

-- Telescope
vim.keymap.set("n", "ff", "<cmd>Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "fg", "<cmd>Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "fb", "<cmd>Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "fb", require('user.telescope.lib').findBuffer, { noremap = true })
-- vim.keymap.set("n", "fr", require('user.lsp.rename'), {noremap = true})

vim.keymap.set("n", "fd", "<cmd>DiffviewOpen<CR>", { noremap = true })

vim.keymap.set("n", "<C-b>", "<cmd>ShowBufferList<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>v", function() require('neoclip.fzf')({ 'unnamed', 'plus' }) end, { noremap = true })

-- avoid copying
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true })

-- remove arrow bindings -> for learning reasons
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("", "<C-w><Left>", "<Nop>")
vim.keymap.set("", "<C-w><Right>", "<Nop>")
vim.keymap.set("", "<C-w><Down>", "<Nop>")
vim.keymap.set("", "<C-w><Up>", "<Nop>")

vim.keymap.set("n", "<Leader>nc", function()
  require("neogen").generate()
end, { noremap = true })
vim.keymap.set("", "<C-h>", function()
  vim.lsp.buf.hover()
end)

-- close all tabs except current
vim.cmd [[command! X %bd|e#|bd#]]
