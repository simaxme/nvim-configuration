function _G.get_winbar()
  local dir = require("oil").get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    return "?"
  end
end

return {
  {
    "stevearc/oil.nvim",
    commit = "cbcb3f997f6f261c577b943ec94e4ef55108dd95",

    opts = {
      win_options = {
        winbar = "%!v:lua.get_winbar()"
      },
      float = {
        border = true,
        override = function(conf)
          conf.border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
          return conf
        end
      },
      view_options = {
        show_hidden = true
      },
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
        ["<Leader>ng"] = {
          mode = "n",
          callback = function()
            require("oil-angular-schematics").create_angular_schematic()
          end
        }
      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "simaxme/oil-angular-schematics.nvim",

    version = "*" -- for stable releases
  }
}
