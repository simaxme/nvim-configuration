local function setup()
  local possession = require("possession")

  possession.setup({
    hooks = {
      after_load = function(name, user_data)
        -- vim.cmd("silent bufdo NvimTreeRefresh")
        -- vim.cmd("silent NvimTreeToggle")
      end
    },
    autosave = {
      current = true,
      on_quit = true,
      tmp = function()
        local git = require("user.git")

        if git.isGitDirectory() then
          git.navigateToGitRoot()
          return true
        end
        return false
      end,
      tmp_name = function()
        local git = require("user.git")

        if git.isGitDirectory() then
          git.navigateToGitRoot()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end

        return "tmp"
      end
    }
  })

  require('telescope').load_extension('possession')

  vim.keymap.set("n", "sl", function()
    require('telescope').extensions.possession.list()
  end)

  vim.keymap.set("n", "sn", ":PossessionSave<CR>")
end

return {
  'jedrzejboczar/possession.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = setup
}
