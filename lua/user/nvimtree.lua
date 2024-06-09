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
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },

  view = {
    width = 40
  },

  git = {
    enable = true,
    ignore = false
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

-- bd fix
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    local api = require('nvim-tree.api')

    -- Only 1 window with nvim-tree left: we probably closed a file buffer
    if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
      -- Required to let the close event complete. An error is thrown without this.
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last hidden buffer used before closing
        api.tree.toggle({ find_file = true, focus = true })
        -- re-open nivm-tree
        api.tree.toggle({ find_file = true, focus = true })
        -- nvim-tree is still the active window. Go to the previous window.
        vim.cmd("wincmd p")
      end, 0)
    end
  end
})

return M
