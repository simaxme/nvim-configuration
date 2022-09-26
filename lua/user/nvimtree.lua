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

    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
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

-- hide seperator
vim.cmd [[
    autocmd VimEnter * hi NvimTreeVertSplit guibg=NONE guifg=background 
]]

return M
