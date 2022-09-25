vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    view = {
        mappings = {
            list ={
                {key = "<C-e>", action=""},
                {key = "E", action=""}
            }
        }
    }
})

vim.api.nvim_set_keymap("", "<S-e>", ":NvimTreeFindFile<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<C-e>", ":NvimTreeToggle<CR>", {noremap = true})
vim.api.nvim_set_keymap("c", "x<CR>", ":bd<CR>", {noremap = true})
