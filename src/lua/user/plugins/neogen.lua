return {
  {
    "danymat/neogen",
    commit = "d7f9461727751fb07f82011051338a9aba07581d",
    opts = {},
    config = function(_, opts)
      require("neogen").setup(opts)

      -- keymap
      vim.keymap.set("n", "<Leader>nc", function()
        require("neogen").generate()
      end, { noremap = true, desc = "Generate documentation for current method/variable/field under cursor" })
    end
  }
}
