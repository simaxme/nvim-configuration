vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local M = {}

local git = require('user.git')

function M.findFile()
    git.navigateToGitRoot()
    vim.cmd [[NvimTreeFindFile]]
end

function M.toggle()
    git.navigateToGitRoot()
    vim.cmd [[NvimTreeToggle]]
end

require('nvim-tree').setup({
    update_focused_file = {
        -- enable = true,
        update_cwd = true
    },

    on_attach = require("user.nvimtree_attach"),

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
        width = 40
        -- mappings = {
        --     list = {
        --         { key = "<C-e>", action = "" },
        --         { key = "E", action = "" },
        --         { key = "<Leader>q", action = "open_nvimtree_options",
        --             action_cb = require('user.telescope.pickers.nvimtreeactions').openSelect },
        --         { key = "ff", action = "telescope_file", action_cb = function() vim.cmd("Telescope find_files") end },
        --         { key = "fg", action = "telescope_grep", action_cb = function() vim.cmd("Telescope live_grep") end }
        --     }
        -- }
    }
})

--require('lsp-file-operations').setup({})

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- hide seperator
vim.cmd [[
    autocmd VimEnter * hi NvimTreeVertSplit guibg=NONE guifg=background 
]]

return M
