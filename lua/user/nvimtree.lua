vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local M = {}

function M.findFile()
    vim.cmd [[silent! Gcd]]
    vim.cmd [[NvimTreeFindFile]]
end

function M.toggle()
    vim.cmd [[silent! Gcd]]
    vim.cmd [[NvimTreeToggle]]
end

require('nvim-tree').setup({
    update_focused_file = {
        enable = true,
        update_cwd = true
    },

    view = {
        width = 40,
        mappings = {
            list ={
                {key = "<C-e>", action=""},
                {key = "E", action=""}
            }
        }
    }
})

vim.api.nvim_set_keymap("", "<S-e>", ":lua require('user.nvimtree').findFile()<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<C-e>", ":lua require('user.nvimtree').toggle()<CR>", {noremap = true})
vim.api.nvim_set_keymap("c", "x<CR>", ":bd | bp<CR>", {noremap = true})

return M
